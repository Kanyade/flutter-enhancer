import 'dart:async';

extension Periodic<T> on T? Function() {
  /// Creates a periodic timer that calls the function every [duration].
  /// 
  /// The returned [Timer] can be used to cancel the periodic calls.
  /// 
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   int count = 0;
  ///
  ///   void incrementCount() {
  ///     count++;
  ///     print("Count: $count");
  ///   }
  ///
  ///   final incrementPeriodically = incrementCount.periodic(duration: const Duration(seconds: 2));
  ///
  ///   Future.delayed(const Duration(seconds: 7), incrementPeriodically.cancel);
  ///   // The function will be called every 2 seconds
  ///   // Output: Count: 1
  ///   //         Count: 2
  ///   //         Count: 3
  /// }
  /// ```
  Timer periodic({Duration duration = const Duration(seconds: 1)}) => Timer.periodic(duration, (_) => this());
}
