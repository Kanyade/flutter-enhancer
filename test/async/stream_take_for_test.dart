import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TakeFor', () {
    test('takes events for specified duration', () async {
      final stream = Stream<int>.periodic(const Duration(milliseconds: 100), (i) => i);

      const duration = Duration(milliseconds: 350);
      final limitedStream = stream.takeFor(duration);

      final receivedData = <int>[];

      await limitedStream.listen(receivedData.add).asFuture();

      // Should receive approximately 3-4 events in 350ms with 100ms intervals
      expect(receivedData.length, greaterThanOrEqualTo(3));
      expect(receivedData.length, lessThanOrEqualTo(4));
      expect(receivedData.first, 0);
    });

    test('stops emitting after duration expires', () async {
      final stream = Stream<int>.periodic(const Duration(milliseconds: 50), (i) => i);

      const duration = Duration(milliseconds: 200);
      final limitedStream = stream.takeFor(duration);

      final receivedData = <int>[];

      await limitedStream.listen(receivedData.add).asFuture();

      final count = receivedData.length;

      // Wait a bit longer to ensure no more events are emitted
      await Future.delayed(const Duration(milliseconds: 100));

      expect(receivedData.length, count);
    });

    test('completes when duration expires', () async {
      final stream = Stream<int>.periodic(const Duration(milliseconds: 50), (i) => i);

      const duration = Duration(milliseconds: 150);
      final limitedStream = stream.takeFor(duration);

      final events = <int>[];
      await limitedStream.listen(events.add).asFuture();

      // Should have captured some events (2-3 events in 150ms with 50ms period)
      expect(events.isNotEmpty, true);
    });

    test('works with short durations', () async {
      final stream = Stream<int>.periodic(const Duration(milliseconds: 50), (i) => i);

      const duration = Duration(milliseconds: 75);
      final limitedStream = stream.takeFor(duration);

      final receivedData = <int>[];

      await limitedStream.listen(receivedData.add).asFuture();

      expect(receivedData.length, greaterThanOrEqualTo(1));
      expect(receivedData.length, lessThanOrEqualTo(2));
    });

    test('handles zero duration', () async {
      final stream = Stream<int>.periodic(const Duration(milliseconds: 50), (i) => i);

      const duration = Duration.zero;
      final limitedStream = stream.takeFor(duration);

      final receivedData = <int>[];

      await limitedStream.listen(receivedData.add).asFuture();

      // Should receive 0 or at most 1 event with zero duration
      expect(receivedData.length, lessThanOrEqualTo(1));
    });

    test('preserves stream values correctly', () async {
      final stream = Stream<int>.periodic(const Duration(milliseconds: 50), (i) => i * 2);

      const duration = Duration(milliseconds: 175);
      final limitedStream = stream.takeFor(duration);

      final receivedData = <int>[];

      await limitedStream.listen(receivedData.add).asFuture();

      expect(receivedData.first, 0);
      if (receivedData.length > 1) {
        expect(receivedData[1], 2);
      }
    });
  });
}
