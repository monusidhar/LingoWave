// Generates the app's feedback sound effects as small WAV files.
// Run from the project root:  dart run tool/gen_sounds.dart
//
// Pure synthesis — no external assets or licenses needed.
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

const sampleRate = 22050;

void main() {
  final dir = Directory('assets/audio');
  dir.createSync(recursive: true);

  // ✅ Correct: two quick ascending chime tones.
  writeWav('assets/audio/correct.wav', [
    Tone(660, 0.09, 0.5),
    Tone(880, 0.14, 0.5),
  ]);

  // ❌ Wrong: short low buzz.
  writeWav('assets/audio/wrong.wav', [
    Tone(150, 0.20, 0.45),
  ]);

  // 🏆 Complete: little ascending arpeggio.
  writeWav('assets/audio/complete.wav', [
    Tone(523, 0.10, 0.45),
    Tone(659, 0.10, 0.45),
    Tone(784, 0.10, 0.45),
    Tone(1046, 0.22, 0.5),
  ]);

  stdout.writeln('Generated correct.wav, wrong.wav, complete.wav');
}

class Tone {
  final double freq;
  final double seconds;
  final double volume;
  const Tone(this.freq, this.seconds, this.volume);
}

void writeWav(String path, List<Tone> tones) {
  final samples = <int>[];
  for (final t in tones) {
    final n = (t.seconds * sampleRate).round();
    for (var i = 0; i < n; i++) {
      // Sine with a quick attack and exponential decay — soft, game-like.
      final time = i / sampleRate;
      final env = min(1.0, i / (0.005 * sampleRate)) * exp(-3.0 * i / n);
      final v = sin(2 * pi * t.freq * time) * t.volume * env;
      samples.add((v * 32767).round().clamp(-32768, 32767));
    }
  }

  final dataSize = samples.length * 2;
  final bytes = BytesBuilder();
  void str(String s) => bytes.add(s.codeUnits);
  void u32(int v) =>
      bytes.add(Uint8List(4)..buffer.asByteData().setUint32(0, v, Endian.little));
  void u16(int v) =>
      bytes.add(Uint8List(2)..buffer.asByteData().setUint16(0, v, Endian.little));

  str('RIFF');
  u32(36 + dataSize);
  str('WAVE');
  str('fmt ');
  u32(16);
  u16(1); // PCM
  u16(1); // mono
  u32(sampleRate);
  u32(sampleRate * 2); // byte rate
  u16(2); // block align
  u16(16); // bits per sample
  str('data');
  u32(dataSize);
  final data = Uint8List(dataSize);
  final bd = data.buffer.asByteData();
  for (var i = 0; i < samples.length; i++) {
    bd.setInt16(i * 2, samples[i], Endian.little);
  }
  bytes.add(data);

  File(path).writeAsBytesSync(bytes.toBytes());
  stdout.writeln('wrote $path (${(36 + dataSize + 8) ~/ 1024} KB)');
}
