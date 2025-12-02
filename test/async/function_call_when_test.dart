import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CallWhen', () {
    test('calls function when predicate is true', () {
      String? getValue() => 'Hello, world!';

      const executeFunction = true;
      final result = getValue.callWhen(predicate: executeFunction);

      expect(result, 'Hello, world!');
    });

    test('does not call function when predicate is false', () {
      var callCount = 0;
      String? getValue() {
        callCount++;
        return 'Hello, world!';
      }

      const executeFunction = false;
      final result = getValue.callWhen(predicate: executeFunction);

      expect(result, null);
      expect(callCount, 0);
    });

    test('returns null from nullable function when predicate is false', () {
      String? getValue() => null;

      const executeFunction = false;
      final result = getValue.callWhen(predicate: executeFunction);

      expect(result, null);
    });

    test('works with non-nullable return types', () {
      int getValue() => 42;

      final result = getValue.callWhen(predicate: true);

      expect(result, 42);
    });

    test('works with complex objects', () {
      Map<String, dynamic> getData() => {'key': 'value', 'number': 123};

      final result = getData.callWhen(predicate: true);

      expect(result, {'key': 'value', 'number': 123});
    });
  });
}
