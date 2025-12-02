extension DelayedCall<T> on T Function() {
  /// Calls the function after a specified [duration] and returns a [Future]
  /// that completes with the function's return value.
  /// 
  /// Example usage:
  /// ```dart
  ///int getNumbers() => 5;
  ///
  ///void main() async {
  ///   var delayedNum = getNumbers.delayedCall(const Duration(seconds: 3));
  ///   var result = await delayedNum;
  ///   print('The num is: $result'); // Output: The num is: 5 (after a 3-second delay)
  ///}
  /// ```
  Future<T> delayedCall(Duration duration) => Future<T>.delayed(duration, this);
}
