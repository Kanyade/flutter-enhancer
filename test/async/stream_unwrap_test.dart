import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnwrapStream', () {
    test('filters out null values from stream', () async {
      final nullableValues = Stream<int?>.fromIterable([1, null, 2, null, 3]);

      final unwrappedValues = nullableValues.unwrap();

      final receivedData = <int>[];

      await unwrappedValues.listen(receivedData.add).asFuture();

      expect(receivedData, [1, 2, 3]);
    });

    test('returns empty stream when all values are null', () async {
      final nullableValues = Stream<int?>.fromIterable([null, null, null]);

      final unwrappedValues = nullableValues.unwrap();

      final receivedData = <int>[];

      await unwrappedValues.listen(receivedData.add).asFuture();

      expect(receivedData, isEmpty);
    });

    test('preserves all values when none are null', () async {
      final nullableValues = Stream<String?>.fromIterable(['a', 'b', 'c']);

      final unwrappedValues = nullableValues.unwrap();

      final receivedData = <String>[];

      await unwrappedValues.listen(receivedData.add).asFuture();

      expect(receivedData, ['a', 'b', 'c']);
    });

    test('works with mixed null and non-null values', () async {
      final nullableValues = Stream<int?>.fromIterable([1, 2, null, 3, null, null, 4, 5]);

      final unwrappedValues = nullableValues.unwrap();

      final receivedData = <int>[];

      await unwrappedValues.listen(receivedData.add).asFuture();

      expect(receivedData, [1, 2, 3, 4, 5]);
    });

    test('works with complex types', () async {
      final nullableValues = Stream<Map<String, int>?>.fromIterable([
        {'a': 1},
        null,
        {'b': 2},
        {'c': 3},
        null,
      ]);

      final unwrappedValues = nullableValues.unwrap();

      final receivedData = <Map<String, int>>[];

      await unwrappedValues.listen(receivedData.add).asFuture();

      expect(receivedData, [
        {'a': 1},
        {'b': 2},
        {'c': 3},
      ]);
    });

    test('preserves stream order', () async {
      final nullableValues = Stream<int?>.fromIterable([10, null, 20, null, 30, 40]);

      final unwrappedValues = nullableValues.unwrap();

      final receivedData = <int>[];

      await unwrappedValues.listen(receivedData.add).asFuture();

      expect(receivedData, [10, 20, 30, 40]);
    });

    test('handles async stream correctly', () async {
      Stream<int?> asyncStream() async* {
        yield 1;
        await Future.delayed(const Duration(milliseconds: 10));
        yield null;
        await Future.delayed(const Duration(milliseconds: 10));
        yield 2;
        await Future.delayed(const Duration(milliseconds: 10));
        yield null;
        await Future.delayed(const Duration(milliseconds: 10));
        yield 3;
      }

      final unwrappedValues = asyncStream().unwrap();

      final receivedData = <int>[];

      await unwrappedValues.listen(receivedData.add).asFuture();

      expect(receivedData, [1, 2, 3]);
    });
  });
}
