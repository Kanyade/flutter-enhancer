import 'dart:async';

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnErrorFinishWith', () {
    test('cancels subscription after first error', () async {
      Stream<int> generateStreamWithError() async* {
        yield 1;
        yield 2;
        yield 3;

        throw Exception('Custom error');
      }

      final receivedValues = <int>[];
      var completed = false;

      await generateStreamWithError().onErrorFinishWith().forEach(receivedValues.add);
      completed = true;

      expect(receivedValues, [1, 2, 3]);
      expect(completed, true);
    });

    test('absorbs error and does not forward it', () async {
      Stream<int> generateStreamWithError() async* {
        yield 1;
        throw Exception('Test error');
      }

      final receivedValues = <int>[];
      final receivedErrors = <Object>[];

      await generateStreamWithError()
          .onErrorFinishWith()
          .listen(
            receivedValues.add,
            onError: (error) => receivedErrors.add(error),
          )
          .asFuture();

      expect(receivedValues, [1]);
      expect(receivedErrors, isEmpty);
    });

    test('emits optional value before closing on error', () async {
      Stream<int> generateStreamWithError() async* {
        yield 1;
        yield 2;
        throw Exception('Error');
      }

      final receivedValues = <int>[];

      await generateStreamWithError().onErrorFinishWith((error) => 999).listen(receivedValues.add).asFuture();

      expect(receivedValues, [1, 2, 999]);
    });

    test('does not emit value if onError returns null', () async {
      Stream<int> generateStreamWithError() async* {
        yield 1;
        yield 2;
        throw Exception('Error');
      }

      final receivedValues = <int>[];

      await generateStreamWithError().onErrorFinishWith((error) => null).listen(receivedValues.add).asFuture();

      expect(receivedValues, [1, 2]);
    });

    test('completes normally if no error occurs', () async {
      final receivedValues = <int>[];

      await Stream.fromIterable([1, 2, 3]).onErrorFinishWith().forEach(receivedValues.add);

      expect(receivedValues, [1, 2, 3]);
    });

    test('onError callback can access error object', () async {
      Stream<int> generateStreamWithError() async* {
        yield 1;
        throw Exception('Specific error message');
      }

      String? errorMessage;
      final receivedValues = <int>[];

      await generateStreamWithError()
          .onErrorFinishWith((error) {
            errorMessage = error.toString();
            return null;
          })
          .listen(receivedValues.add)
          .asFuture();

      expect(receivedValues, [1]);
      expect(errorMessage, contains('Specific error message'));
    });

    test('handles error at the beginning of stream', () async {
      Stream<int> generateStreamWithError() async* {
        throw Exception('Immediate error');
      }

      final receivedValues = <int>[];

      await generateStreamWithError().onErrorFinishWith((error) => 0).listen(receivedValues.add).asFuture();

      expect(receivedValues, [0]);
    });
  });
}
