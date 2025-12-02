import 'dart:async';

extension Throttle<T> on T? Function() {
  static final _throttleTimers = <String, Timer>{};

  /// Throttles the execution of the function.
  /// The function can only be called once within the specified [duration].
  /// If the function is called again within the duration, it will be ignored.
  /// [tag] can be used to differentiate between different throttled functions.
  /// If no [tag] is provided, the hash code of the function will be used.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   void printMessage() => print("Throttled message");
  ///   void throttledPrint() => printMessage.throttle(duration: const Duration(seconds: 2));
  ///
  ///   throttledPrint();
  ///   // The function will be called immediately
  ///   // Output: Throttled message
  ///
  ///   throttledPrint();
  ///   // The function will be ignored since it's within the throttle duration
  ///
  ///   Future.delayed(const Duration(seconds: 1), throttledPrint);
  ///   // The function will be ignored since it's within the throttle duration
  ///
  ///   Future.delayed(const Duration(seconds: 2), throttledPrint);
  ///   // After 2 seconds, the function will be called again
  ///   // Output: Throttled message
  /// }
  /// ```
  void throttle({String? tag, Duration duration = const Duration(seconds: 1)}) {
    tag ??= '$hashCode';
    if (!_throttleTimers.containsKey(tag)) {
      _throttleTimers[tag] = Timer(duration, () => _throttleTimers.remove(tag));
      this();
    }
  }
}
