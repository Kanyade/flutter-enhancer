extension HardcodedStringExtension on String {
  /// Marks this string as hardcoded for localization later.
  /// This makes it easier to find hardcoded strings in the codebase.
  ///
  /// Example usage:
  /// ```dart
  /// final greeting = 'Hello, world!'.hardcoded;
  /// ```
  String get hardcoded => this;
}

extension StringExtension on String? {
  /// Checks if the string matches the given regex pattern.
  ///
  /// Example usage:
  /// ```dart
  /// final text = 'Hello123';
  /// print(text.hasMatch(r'^\d+$')); // false
  /// ```
  bool hasMatch(String pattern) => this != null ? RegExp(pattern).hasMatch(this!) : false;

  /// Checks if the string contains only numeric characters.
  ///
  /// Example usage:
  /// ```dart
  /// final text = '12345';
  /// print(text.isNumericOnly()); // true
  /// ```
  bool isNumericOnly() => hasMatch(r'^\d+$');

  /// Checks if the string contains only alphabetic characters.
  ///
  /// Example usage:
  /// ```dart
  /// final text = 'Hello';
  /// print(text.isAlphabetOnly()); // true
  /// ```
  bool isAlphabetOnly() => hasMatch(r'^[a-zA-Z]+$');

  /// Checks if the string is a boolean value ('true' or 'false').
  ///
  /// Example usage:
  /// ```dart
  /// final text = 'true';
  /// print(text.isBool()); // true
  /// ```
  bool isBool() => this == 'true' || this == 'false';

  /// Checks if the string is null, empty, or contains only whitespace.
  ///
  /// Example usage:
  /// ```dart
  /// final text = '   ';
  /// print(text.isBlank); // true
  /// ```
  bool get isBlank => this?.trim().isEmpty ?? true;

  /// Estimates the read time in minutes based on the word count.
  ///
  /// You can specify the words per minute (default is 200).
  ///
  /// Example usage:
  /// ```dart
  /// final text = 'This is a sample text for estimating read time.';
  /// print(text.getReadTime()); // 1
  /// ```
  int getReadTime({int wordsPerMinute = 200}) {
    if (isBlank) {
      return 0;
    }
    final words = this!.trim().split(RegExp(r'(\s+)'));
    final magicalNumber = words.length / wordsPerMinute;
    return magicalNumber.ceil();
  }

  /// Counts the number of words in the string, filtering out symbols and numbers.
  ///
  /// Example usage:
  /// ```dart
  /// final text = 'Hello, world! 123';
  /// print(text.wordCount); // 2
  /// ```
  int get wordCount {
    if (isBlank) {
      return 0;
    }
    final words = this!.trim().split(RegExp(r'(\s+)'));
    // We filter out symbols and numbers from the word count
    final filteredWords = words.where((e) => e.onlyLatin.isNotEmpty);
    return filteredWords.length;
  }

  /// Reverses the string.
  ///
  /// Example usage:
  /// ```dart
  /// final text = 'Hello';
  /// print(text.reversed); // 'olleH'
  /// ```
  String? get reversed {
    if (isBlank) {
      return this;
    }
    final letters = this!.split('').toList().reversed;
    return letters.reduce((current, next) => current + next);
  }

  /// Returns a new string containing only Latin alphabet characters (a-z, A-Z) and spaces.
  ///
  /// Example usage:
  /// ```dart
  /// final text = 'Hello, 世界! 123';
  /// print(text.onlyLatin); // 'Hello  '
  /// ```
  String get onlyLatin {
    if (isBlank) {
      return this ?? '';
    }

    final regex = RegExp(r'([^a-zA-Z\s]+)');
    return this!.replaceAll(regex, '');
  }

  /// Capitalizes the first letter of the string and makes the rest lowercase.
  ///
  /// Example usage:
  /// ```dart
  /// final text = 'hELLO';
  /// print(text.capitalized); // 'Hello'
  /// ```
  String get capitalized {
    if (isBlank) return this ?? '';
    final text = this!;
    if (text.length == 1) {
      return text.toUpperCase();
    }

    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }
}
