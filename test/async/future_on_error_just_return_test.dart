import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnError', () {
    test('onErrorJustReturn returns provided value on error', () async {
      Future<int> fetchData() async {
        await Future.delayed(const Duration(milliseconds: 50));
        throw Exception('Error occurred during data fetching');
      }

      final result = await fetchData().onErrorJustReturn(0);

      expect(result, 0);
    });

    test('onErrorJustReturn returns normal value when no error', () async {
      Future<int> fetchData() async {
        await Future.delayed(const Duration(milliseconds: 50));
        return 42;
      }

      final result = await fetchData().onErrorJustReturn(0);

      expect(result, 42);
    });

    test('onErrorJustReturn works with different types', () async {
      Future<String> fetchData() async {
        throw Exception('Error');
      }

      final result = await fetchData().onErrorJustReturn('default');

      expect(result, 'default');
    });
  });

  group('OnErrorNullable', () {
    test('drainErrorsNullable returns null on error', () async {
      Future<int?> fetchData() async {
        await Future.delayed(const Duration(milliseconds: 50));
        throw Exception('Error occurred during data fetching');
      }

      final result = await fetchData().drainErrorsNullable();

      expect(result, null);
    });

    test('drainErrorsNullable returns normal value when no error', () async {
      Future<int?> fetchData() async {
        await Future.delayed(const Duration(milliseconds: 50));
        return 42;
      }

      final result = await fetchData().drainErrorsNullable();

      expect(result, 42);
    });

    test('drainErrorsAll returns null on error for non-nullable future', () async {
      Future<int> fetchData() async {
        await Future.delayed(const Duration(milliseconds: 50));
        throw Exception('Error occurred during data fetching');
      }

      final result = await fetchData().drainErrorsAll();

      expect(result, null);
    });

    test('drainErrorsAll returns normal value when no error', () async {
      Future<int> fetchData() async {
        await Future.delayed(const Duration(milliseconds: 50));
        return 100;
      }

      final result = await fetchData().drainErrorsAll();

      expect(result, 100);
    });

    test('drainErrorsAll works with nullable return types', () async {
      Future<String?> fetchData() async => 'success';

      final result = await fetchData().drainErrorsAll();

      expect(result, 'success');
    });

    test('drainErrorsAll handles null return values', () async {
      Future<String?> fetchData() async => null;

      final result = await fetchData().drainErrorsAll();

      expect(result, null);
    });
  });
}
