import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// One item the learner got wrong, with enough identity to regenerate an
/// equivalent exercise later:
/// - kind 'vocab'   → [key] is the word's `en` in that lesson's vocab bank
/// - kind 'sentence'→ [key] is the sentence's `en` in the speaking bank
/// - kind 'mcq'     → [key] is the authored question's `questionEn`
class MistakeRecord {
  final int chapterId;
  final int lessonId;
  final String kind;
  final String key;
  final int timestamp;
  final int correctStreak;

  const MistakeRecord({
    required this.chapterId,
    required this.lessonId,
    required this.kind,
    required this.key,
    required this.timestamp,
    this.correctStreak = 0,
  });

  /// Identity: same item regardless of timestamp/streak.
  String get id => 'ch${chapterId}_les${lessonId}_${kind}_$key';

  Map<String, dynamic> toJson() => {
        'c': chapterId,
        'l': lessonId,
        'k': kind,
        'q': key,
        't': timestamp,
        's': correctStreak,
      };

  static MistakeRecord? fromJson(dynamic j) {
    if (j is! Map) return null;
    final c = j['c'], l = j['l'], k = j['k'], q = j['q'];
    if (c is! int || l is! int || k is! String || q is! String) return null;
    return MistakeRecord(
      chapterId: c,
      lessonId: l,
      kind: k,
      key: q,
      timestamp: j['t'] is int ? j['t'] as int : 0,
      correctStreak: j['s'] is int ? j['s'] as int : 0,
    );
  }

  MistakeRecord copyWith({int? timestamp, int? correctStreak}) =>
      MistakeRecord(
        chapterId: chapterId,
        lessonId: lessonId,
        kind: kind,
        key: key,
        timestamp: timestamp ?? this.timestamp,
        correctStreak: correctStreak ?? this.correctStreak,
      );
}

/// Local "practice your mistakes" store (Step 3, v2.2). SharedPreferences,
/// backend-light per the roadmap. Keys are `lw_`-prefixed so logout's
/// resetAll() clears them along with the rest of the user's local state.
class ReviewService {
  static const String _storeKey = 'lw_mistakes';

  /// Answering an item correctly this many times removes it from the pool.
  static const int clearAfterCorrect = 2;

  /// Pool cap — oldest items drop first so the store can't grow unbounded.
  static const int maxPoolSize = 100;

  static Future<List<MistakeRecord>> getPending() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storeKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw);
      if (list is! List) return [];
      return list
          .map(MistakeRecord.fromJson)
          .whereType<MistakeRecord>()
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<int> pendingCount() async => (await getPending()).length;

  /// Record a wrong answer. Re-missing a known item resets its progress.
  static Future<void> recordMistake({
    required int chapterId,
    required int lessonId,
    required String kind,
    required String key,
  }) async {
    final record = MistakeRecord(
      chapterId: chapterId,
      lessonId: lessonId,
      kind: kind,
      key: key,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    final pending = await getPending();
    pending.removeWhere((r) => r.id == record.id);
    pending.add(record);
    // Cap: drop oldest first.
    if (pending.length > maxPoolSize) {
      pending.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      pending.removeRange(0, pending.length - maxPoolSize);
    }
    await _save(pending);
  }

  /// Apply a review answer: right twice → item clears; wrong → start over.
  static Future<void> recordReviewResult(
      MistakeRecord record, bool correct) async {
    final pending = await getPending();
    final idx = pending.indexWhere((r) => r.id == record.id);
    if (idx == -1) return;
    if (correct) {
      final streak = pending[idx].correctStreak + 1;
      if (streak >= clearAfterCorrect) {
        pending.removeAt(idx);
      } else {
        pending[idx] = pending[idx].copyWith(correctStreak: streak);
      }
    } else {
      pending[idx] = pending[idx].copyWith(correctStreak: 0);
    }
    await _save(pending);
  }

  /// Drop a record whose source content no longer exists.
  static Future<void> removeStale(MistakeRecord record) async {
    final pending = await getPending();
    pending.removeWhere((r) => r.id == record.id);
    await _save(pending);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storeKey);
  }

  static Future<void> _save(List<MistakeRecord> records) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _storeKey, jsonEncode(records.map((r) => r.toJson()).toList()));
  }
}
