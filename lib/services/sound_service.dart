import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/// 🔊 Feedback sound effects (Step 5, v2.4). The WAVs in assets/audio/ are
/// synthesized by tool/gen_sounds.dart — no licensed assets involved.
/// Every call is fail-soft: a missing audio device or platform quirk must
/// never break the lesson flow.
class SoundService {
  static final SoundService _instance = SoundService._internal();
  factory SoundService() => _instance;
  SoundService._internal();

  final AudioPlayer _player = AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop)
    ..setPlayerMode(PlayerMode.lowLatency);

  Future<void> _play(String asset) async {
    if (kIsWeb) return;
    try {
      await _player.stop();
      await _player.play(AssetSource(asset), volume: 0.6);
    } catch (_) {
      // Sounds are decoration — never surface errors.
    }
  }

  Future<void> playCorrect() => _play('audio/correct.wav');
  Future<void> playWrong() => _play('audio/wrong.wav');
  Future<void> playComplete() => _play('audio/complete.wav');
}
