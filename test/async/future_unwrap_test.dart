import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnwrapFuture', () {
    test('unwrapWith returns value when future resolves to non-null', () async {
      Future<int?> fetchDataFromServer() async {
        await Future.delayed(const Duration(milliseconds: 50));
        return 42;
      }

      final result = await fetchDataFromServer().unwrapWith(0);

      expect(result, 42);
    });

    test('unwrapWith returns alternative when future resolves to null', () async {
      Future<int?> fetchDataFromServer() async {
        await Future.delayed(const Duration(milliseconds: 50));
        return null;
      }

      final result = await fetchDataFromServer().unwrapWith(2);

      expect(result, 2);
    });

    test('unwrapWith works with string type', () async {
      final Future<String?> nullableValue = Future.value();

      final result = await nullableValue.unwrapWith('default');

      expect(result, 'default');
    });

    test('unwrapWith returns actual string value', () async {
      final Future<String?> nullableValue = Future.value('Hello');

      final result = await nullableValue.unwrapWith('default');

      expect(result, 'Hello');
    });

    test('unwrapWith works with complex types', () async {
      final Future<List<int>?> nullableList = Future.value();

      final result = await nullableList.unwrapWith([1, 2, 3]);

      expect(result, [1, 2, 3]);
    });

    test('unwrapWith preserves actual complex type value', () async {
      final Future<Map<String, int>?> nullableMap = Future.value({'a': 1, 'b': 2});

      final result = await nullableMap.unwrapWith({});

      expect(result, {'a': 1, 'b': 2});
    });

    test('unwrapWith handles immediate futures', () async {
      final result = await Future<int?>.value().unwrapWith(100);

      expect(result, 100);
    });
  });
}
