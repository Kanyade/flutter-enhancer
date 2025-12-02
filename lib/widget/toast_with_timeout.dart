import 'dart:async';
import 'package:flutter/material.dart';

extension ToastyWidget on Widget {
  /// Displays the widget as a toast dialog for a specified duration.
  ///
  /// The toast will be shown as a modal dialog with an optional barrier color.
  /// The dialog will automatically dismiss after the specified duration.
  /// 
  /// Example usage:
  /// ```dart
  /// MyToastWidget().asToast(
  ///   context: context,
  ///   barrierColor: Colors.black54,
  ///   duration: Duration(seconds: 2),
  /// );
  /// ```
  void asToast({
    required BuildContext context,
    Color barrierColor = Colors.black54,
    Duration duration = const Duration(seconds: 3),
  }) {
    unawaited(
      showDialog(
        context: context,
        barrierColor: barrierColor,
        barrierDismissible: false,
        builder: (context) => this,
      ),
    );

    Future.delayed(duration, Navigator.of(context).pop);
    return;
  }
}
