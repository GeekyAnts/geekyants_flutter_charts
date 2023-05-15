import 'package:flutter/material.dart';

class BarChartScope extends InheritedWidget {
  const BarChartScope({required Widget child, Key? key})
      : super(key: key, child: child);

  ///LinearGaugeState scope method.
  static BarChartScope of(BuildContext context) {
    late BarChartScope scope;

    final InheritedWidget widget = context
        .getElementForInheritedWidgetOfExactType<BarChartScope>()!
        .widget as InheritedWidget;

    if (widget is BarChartScope) {
      scope = widget;
    }

    return scope;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
