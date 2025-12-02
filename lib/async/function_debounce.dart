import 'dart:async';

extension Debounce<T> on T? Function() {
  static final _debounceTimers = <String, Timer>{};

  /// Debounces the execution of the function.
  /// If the function is called multiple times within the specified [duration],
  /// it will only be executed once after the duration has passed since the last call.
  ///
  /// [tag] is an optional identifier to distinguish between different debounced functions.
  /// If not provided, the hash code of the function instance is used.
  ///
  /// Example usage:
  /// ```dart
  /// void fetchData() {
  ///   print("Fetching data...");
  ///   // Simulating an asynchronous API call
  ///   Future.delayed(const Duration(seconds: 2), () {
  ///     print("Data fetched successfully!");
  ///   });
  /// }
  ///
  /// void main() {
  ///   fetchData.debounce();
  ///   fetchData.debounce();
  ///   fetchData.debounce();
  ///   fetchData.debounce();
  ///
  ///   // Output:
  ///   // Fetching data...
  ///   // Data fetched successfully!
  /// }
  /// ```
  void debounce({String? tag, Duration duration = const Duration(seconds: 1)}) {
    tag ??= '$hashCode';
    _debounceTimers[tag]?.cancel();
    _debounceTimers[tag] = Timer(duration, () {
      _debounceTimers.remove(tag);
      this();
    });
  }
}
