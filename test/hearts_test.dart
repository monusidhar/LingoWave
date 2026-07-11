import 'package:flutter_test/flutter_test.dart';
import 'package:lingowave/services/hearts_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  final t0 = DateTime(2026, 7, 10, 12, 0);
  DateTime plusMin(int m) => t0.add(Duration(minutes: m));

  test('starts full, wrong answers deplete, floors at zero', () async {
    expect(await HeartsService.current(now: t0), HeartsService.maxHearts);

    for (var i = 0; i < HeartsService.maxHearts; i++) {
      await HeartsService.loseHeart(now: t0);
    }
    expect(await HeartsService.current(now: t0), 0);
    expect(await HeartsService.canStartLesson(now: t0), isFalse);

    // Extra losses don't go negative.
    await HeartsService.loseHeart(now: t0);
    expect(await HeartsService.current(now: t0), 0);
  });

  test('hearts refill one per refillMinutes, capped at max', () async {
    await HeartsService.loseHeart(now: t0);
    await HeartsService.loseHeart(now: t0);
    await HeartsService.loseHeart(now: t0);
    expect(await HeartsService.current(now: t0), 2);

    // 29 minutes: nothing yet.
    expect(await HeartsService.current(now: plusMin(29)), 2);
    // 30 minutes: +1.
    expect(await HeartsService.current(now: plusMin(30)), 3);
    // 90 minutes total: back to full (only needed 3).
    expect(await HeartsService.current(now: plusMin(95)), 5);
    // Far future: still capped.
    expect(await HeartsService.current(now: plusMin(10000)),
        HeartsService.maxHearts);
  });

  test('partial refill progress is preserved across reads', () async {
    await HeartsService.loseHeart(now: t0);
    await HeartsService.loseHeart(now: t0);
    // Read at 45 min: one heart refilled, 15 min progress toward the next.
    expect(await HeartsService.current(now: plusMin(45)), 4);
    // Only 15 more minutes later the next heart arrives at 60.
    expect(await HeartsService.current(now: plusMin(59)), 4);
    expect(await HeartsService.current(now: plusMin(60)), 5);
  });

  test('rewarded-ad refill restores full hearts instantly', () async {
    for (var i = 0; i < 5; i++) {
      await HeartsService.loseHeart(now: t0);
    }
    expect(await HeartsService.canStartLesson(now: t0), isFalse);

    await HeartsService.refillFull(now: t0);
    expect(await HeartsService.current(now: t0), HeartsService.maxHearts);
    expect(await HeartsService.canStartLesson(now: t0), isTrue);
  });

  test('minutesToNextHeart counts down and is 0 when full', () async {
    expect(await HeartsService.minutesToNextHeart(now: t0), 0);
    await HeartsService.loseHeart(now: t0);
    expect(await HeartsService.minutesToNextHeart(now: t0),
        HeartsService.refillMinutes);
    expect(await HeartsService.minutesToNextHeart(now: plusMin(10)), 20);
  });
}
