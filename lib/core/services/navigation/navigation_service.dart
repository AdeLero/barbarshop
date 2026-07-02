import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator {
    final navigator = navigatorKey.currentState;
    if (navigator == null) {
      throw StateError('NavigationService is not attached to a Navigator.');
    }
    return navigator;
  }

  BuildContext? get context => navigatorKey.currentContext;

  Future<T?> push<T>(Widget page) {
    return _navigator.push<T>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<T?> pushReplacement<T, TO>(Widget page) {
    return _navigator.pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<T?> pushAndRemoveUntil<T>(Widget page, RoutePredicate predicate) {
    return _navigator.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      predicate,
    );
  }

  void pop<T extends Object?>([T? result]) {
    if (_navigator.canPop()) {
      _navigator.pop(result);
    }
  }
}
