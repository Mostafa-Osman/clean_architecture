import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {
  void requestFocus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node);
}
