import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Access to the NavigatorState associated with this BuildContext
  /// for easier navigation calls.
  NavigatorState get navigator => Navigator.of(this);

  /// Calls Navigator.canPop with this BuildContext.
  bool canPop() => Navigator.canPop(this);

  /// Calls Navigator.pop with this BuildContext.
  void pop<T>({dynamic result}) => navigator.pop<T>(result);

  /// Calls Navigator.maybePop with this BuildContext.
  Future<bool> maybePop<T>({dynamic result}) => navigator.maybePop<T>(result);

  /// Calls Navigator.push with this BuildContext.
  Future<T?> push<T extends Object?>(Route<T> route) => navigator.push<T>(route);

  /// Calls Navigator.pushReplacement with this BuildContext.
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Route<T> newRoute, {TO? result}) =>
      navigator.pushReplacement<T, TO>(newRoute, result: result);

  /// Calls Navigator.pushAndRemoveUntil with this BuildContext.
  Future<T?> pushAndRemoveUntil<T extends Object?>(Route<T> newRoute, RoutePredicate predicate) =>
      navigator.pushAndRemoveUntil(newRoute, predicate);

  /// Calls Navigator.pushNamed with this BuildContext.
  Future<T?> pushNamed<T extends Object?>(String screenName, {Object? arguments}) =>
      navigator.pushNamed<T>(screenName, arguments: arguments);

  /// Calls Navigator.pushReplacementNamed with this BuildContext.
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) => navigator.pushReplacementNamed(routeName, result: result, arguments: arguments);

  /// Calls Navigator.popUntil with this BuildContext.
  void popUntil(String screenName) => navigator.popUntil(ModalRoute.withName(screenName));
}
