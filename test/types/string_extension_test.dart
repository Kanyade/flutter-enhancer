import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HardcodedStringExtension', () {
    test('hardcoded returns same string', () {
      final greeting = 'Hello, world!'.hardcoded;

      expect(greeting, 'Hello, world!');
    });

    test('hardcoded is chainable', () {
      final text = 'Test'.hardcoded.toUpperCase();

      expect(text, 'TEST');
    });
  });

  group('StringExtension', () {
    test('hasMatch returns true for matching pattern', () {
      const text = 'Hello123';

      expect(text.hasMatch(r'[A-Z]'), true);
    });

    test('hasMatch returns false for non-matching pattern', () {
      const text = 'Hello123';

      expect(text.hasMatch(r'^\d+$'), false);
    });

    test('isNumericOnly returns true for numeric string', () {
      const text = '12345';

      expect(text.isNumericOnly(), true);
    });

    test('isNumericOnly returns false for non-numeric', () {
      const text = '123a45';

      expect(text.isNumericOnly(), false);
    });

    test('isAlphabetOnly returns true for alphabetic string', () {
      const text = 'Hello';

      expect(text.isAlphabetOnly(), true);
    });

    test('isAlphabetOnly returns false for non-alphabetic', () {
      const text = 'Hello123';

      expect(text.isAlphabetOnly(), false);
    });

    test('isBool returns true for "true"', () {
      const text = 'true';

      expect(text.isBool(), true);
    });

    test('isBool returns true for "false"', () {
      const text = 'false';

      expect(text.isBool(), true);
    });

    test('isBool returns false for other values', () {
      const text = 'yes';

      expect(text.isBool(), false);
    });

    test('isBlank returns true for empty string', () {
      const text = '';

      expect(text.isBlank, true);
    });

    test('isBlank returns true for whitespace only', () {
      const text = '   ';

      expect(text.isBlank, true);
    });

    test('isBlank returns true for null', () {
      String? text;

      expect(text.isBlank, true);
    });

    test('isBlank returns false for non-blank', () {
      const text = 'Hello';

      expect(text.isBlank, false);
    });

    test('wordCount counts words correctly', () {
      const text = 'Hello, world! 123';

      expect(text.wordCount, 2);
    });

    test('wordCount returns 0 for blank', () {
      const text = '   ';

      expect(text.wordCount, 0);
    });

    test('reversed reverses string', () {
      const text = 'Hello';

      expect(text.reversed, 'olleH');
    });

    test('onlyLatin filters non-latin characters', () {
      const text = 'Hello, 世界! 123';

      expect(text.onlyLatin, 'Hello  ');
    });

    test('onlyLatin preserves spaces', () {
      const text = 'Hello World';

      expect(text.onlyLatin, 'Hello World');
    });

    test('capitalized capitalizes first letter', () {
      const text = 'hELLO';

      expect(text.capitalized, 'Hello');
    });

    test('capitalized works with single letter', () {
      const text = 'h';

      expect(text.capitalized, 'H');
    });

    test('capitalized returns empty for blank', () {
      const text = '';

      expect(text.capitalized, '');
    });

    test('getReadTime calculates read time', () {
      final text = List.generate(200, (i) => 'word').join(' ');

      expect(text.getReadTime(), 1);
    });

    test('getReadTime with custom words per minute', () {
      final text = List.generate(400, (i) => 'word').join(' ');

      expect(text.getReadTime(), 2);
    });

    test('getReadTime returns 0 for blank', () {
      const text = '';

      expect(text.getReadTime(), 0);
    });
  });
}
