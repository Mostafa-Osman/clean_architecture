import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {


  void pop({Object? result}) => Navigator.pop(this, result);

  Future pushNamed(String routeName, {Object? arguments}) async {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future pushNamedAndRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) async {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pushNamedAndRemoveAll(String routeName, {Object? arguments}) {
    pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }
  Object? get args => ModalRoute.of(this)!.settings.arguments;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
  void requestFocus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node);
}
