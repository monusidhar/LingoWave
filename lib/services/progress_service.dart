import 'package:shared_preferences/shared_preferences.dart';
import '../models/lesson_model.dart';

/// Handles saving and loading lesson/chapter progress using SharedPreferences.
/// Keys format:
///   chapter_{chapterId}_lesson_{lessonId}_status  → int (0=locked,1=inProgress,2=completed)
///   chapter_{chapterId}_lesson_{lessonId}_xp      → int
class ProgressService {
  /// Reset all XP, lesson, and chapter progress (for fresh start)
  static Future<void> resetAllProgress() async {
    final prefs = await SharedPreferences.getInstance();
    // Remove all XP, lesson status, and chapter status keys
    final keys = prefs.getKeys().where((k) => k.startsWith(_prefix)).toList();
    for (final k in keys) {
      if (k.contains('_xp') || k == _totalXpKey || k.contains('_status')) {
        await prefs.remove(k);
      }
    }
  }

  static const String _prefix = 'lw_';

  // ─── Keys ──────────────────────────────────────────────────────────────────
  static String _statusKey(int chapterId, int lessonId) =>
      '${_prefix}ch${chapterId}_les${lessonId}_status';

  static String _xpKey(int chapterId, int lessonId) =>
      '${_prefix}ch${chapterId}_les${lessonId}_xp';

  static String _chapterStatusKey(int chapterId) =>
      '${_prefix}ch${chapterId}_status';

  static const String _userNameKey = '${_prefix}user_name';
  static const String _userLevelKey = '${_prefix}user_level';
  static const String _streakKey = '${_prefix}streak';
  static const String _lastActiveKey = '${_prefix}last_active';
  static const String _totalXpKey = '${_prefix}total_xp';

  // ─── Save lesson status ────────────────────────────────────────────────────
  static Future<void> saveLessonStatus(
      int chapterId, int lessonId, LessonStatus status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_statusKey(chapterId, lessonId), status.index);
  }

  // ─── Load lesson status ────────────────────────────────────────────────────
  static Future<LessonStatus> loadLessonStatus(
      int chapterId, int lessonId, LessonStatus defaultStatus) async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getInt(_statusKey(chapterId, lessonId));
    if (val == null) return defaultStatus;
    return LessonStatus.values[val];
  }

  // ─── Save lesson XP ───────────────────────────────────────────────────────
  static Future<void> saveLessonXP(int chapterId, int lessonId, int xp) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_xpKey(chapterId, lessonId), xp);
  }

  // ─── Load lesson XP ───────────────────────────────────────────────────────
  static Future<int> loadLessonXP(int chapterId, int lessonId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_xpKey(chapterId, lessonId)) ?? 0;
  }

  // ─── Save chapter status ──────────────────────────────────────────────────
  static Future<void> saveChapterStatus(
      int chapterId, LessonStatus status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_chapterStatusKey(chapterId), status.index);
  }

  // ─── Load chapter status ──────────────────────────────────────────────────
  static Future<LessonStatus> loadChapterStatus(
      int chapterId, LessonStatus defaultStatus) async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getInt(_chapterStatusKey(chapterId));
    if (val == null) return defaultStatus;
    return LessonStatus.values[val];
  }

  // ─── Complete a lesson: mark complete, save XP, unlock next ───────────────
  static Future<void> completeLesson({
    required int chapterId,
    required int lessonId,
    required int xpEarned,
    required int totalLessonsInChapter,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    // Mark this lesson completed
    await prefs.setInt(
        _statusKey(chapterId, lessonId), LessonStatus.completed.index);
    await prefs.setInt(_xpKey(chapterId, lessonId), xpEarned);

    // Unlock next lesson (if not last)
    if (lessonId < totalLessonsInChapter) {
      final nextKey = _statusKey(chapterId, lessonId + 1);
      final nextVal = prefs.getInt(nextKey);
      // Only unlock if currently locked
      if (nextVal == null || nextVal == LessonStatus.locked.index) {
        await prefs.setInt(nextKey, LessonStatus.inProgress.index);
      }
    }

    // Update total XP
    final currentTotal = prefs.getInt(_totalXpKey) ?? 0;
    await prefs.setInt(_totalXpKey, currentTotal + xpEarned);

    // Update streak
    await _updateStreak(prefs);
  }

  // ─── Load all lessons for a chapter ───────────────────────────────────────
  static Future<void> loadChapterProgress(ChapterModel chapter) async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < chapter.lessons.length; i++) {
      final lesson = chapter.lessons[i];
      final statusVal = prefs.getInt(_statusKey(chapter.id, lesson.id));
      final xp = prefs.getInt(_xpKey(chapter.id, lesson.id)) ?? 0;

      if (statusVal != null) {
        // Saved value exists — always use it (takes priority over defaults)
        lesson.status = LessonStatus.values[statusVal];
        lesson.xpEarned = xp;
      }
      // If nothing saved, keep whatever status was set in the model data
      // This allows TEST MODE (all inProgress) to work correctly
    }

    // Load chapter status
    final chapterStatusVal = prefs.getInt(_chapterStatusKey(chapter.id));
    if (chapterStatusVal != null) {
      chapter.status = LessonStatus.values[chapterStatusVal];
    }
  }

  // ─── User profile ──────────────────────────────────────────────────────────
  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
  }

  static Future<String> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey) ?? '';
  }

  static Future<void> saveUserLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userLevelKey, level);
  }

  static Future<int> loadUserLevel() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userLevelKey) ??
        0; // 0=beginner,1=elementary,2=intermediate
  }

  static Future<int> loadTotalXP() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_totalXpKey) ?? 0;
  }

  static Future<int> loadStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_streakKey) ?? 0;
  }

  static Future<bool> isOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey) != null &&
        (prefs.getString(_userNameKey)?.isNotEmpty ?? false);
  }

  // ─── Reset all progress (for testing) ─────────────────────────────────────
  static Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((k) => k.startsWith(_prefix)).toList();
    for (final k in keys) {
      await prefs.remove(k);
    }
  }

  // ─── Internal: update streak ───────────────────────────────────────────────
  static Future<void> _updateStreak(SharedPreferences prefs) async {
    final today = DateTime.now();
    final todayStr =
        '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    final lastActive = prefs.getString(_lastActiveKey);
    final streak = prefs.getInt(_streakKey) ?? 0;

    if (lastActive == null) {
      // First time
      await prefs.setInt(_streakKey, 1);
      await prefs.setString(_lastActiveKey, todayStr);
    } else if (lastActive == todayStr) {
      // Already active today — no change
    } else {
      // Check if yesterday
      final last = DateTime.parse(lastActive);
      final diff = today.difference(last).inDays;
      if (diff == 1) {
        await prefs.setInt(_streakKey, streak + 1);
      } else {
        await prefs.setInt(_streakKey, 1); // reset streak
      }
      await prefs.setString(_lastActiveKey, todayStr);
    }
  }

  static Future<void> restoreProgressFromBackend(
    List<dynamic> progressData) async {
  final prefs = await SharedPreferences.getInstance();

  for (final progress in progressData) {
    final chapterId = progress['chapterId'] as int;
    final lessonId = progress['lessonId'] as int;
    final completed = progress['completed'] as bool;
    final xpEarned = progress['xpEarned'] as int;

    if (completed) {
      // Save lesson as completed
      await prefs.setInt(
        '${_prefix}ch${chapterId}_les${lessonId}_status',
        LessonStatus.completed.index,
      );
      await prefs.setInt(
        '${_prefix}ch${chapterId}_les${lessonId}_xp',
        xpEarned,
      );

      // Update total XP
      final currentXp = prefs.getInt(_totalXpKey) ?? 0;
      await prefs.setInt(_totalXpKey, currentXp + xpEarned);
    }
  }

  // Unlock next lessons based on completed ones
  await _unlockNextLessonsFromProgress(prefs, progressData);
}

static Future<void> _unlockNextLessonsFromProgress(
    SharedPreferences prefs, List<dynamic> progressData) async {
  // Group by chapter
  final Map<int, List<int>> chapterLessons = {};
  for (final p in progressData) {
    if (p['completed'] == true) {
      final chId = p['chapterId'] as int;
      final lsId = p['lessonId'] as int;
      chapterLessons[chId] = [...(chapterLessons[chId] ?? []), lsId];
    }
  }

  // For each chapter, unlock next lesson after last completed
  for (final entry in chapterLessons.entries) {
    final chapterId = entry.key;
    final completedLessons = entry.value..sort();
    if (completedLessons.isNotEmpty) {
      final lastCompleted = completedLessons.last;
      final nextKey =
          '${_prefix}ch${chapterId}_les${lastCompleted + 1}_status';
      final nextVal = prefs.getInt(nextKey);
      if (nextVal == null ||
          nextVal == LessonStatus.locked.index) {
        await prefs.setInt(
            nextKey, LessonStatus.inProgress.index);
      }
    }
  }
}
}
