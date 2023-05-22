import 'package:flutter/material.dart';

/// A widget that provides a scope for the BarChart widget.
///
/// This widget is an [InheritedWidget], which allows descendant widgets to
/// obtain the [VerticalBarChartScope] instance using the [of] method.
class VerticalBarChartScope extends InheritedWidget {
  /// Creates a [VerticalBarChartScope] widget.
  ///
  /// The [child] parameter is required and represents the child widget
  /// that will have access to the [VerticalBarChartScope].
  const VerticalBarChartScope({required Widget child, Key? key})
      : super(key: key, child: child);

  /// Retrieves the nearest [VerticalBarChartScope] instance from the given [context].
  ///
  /// Throws an error if no [VerticalBarChartScope] instance is found in the widget
  /// tree above the given [context].
  static VerticalBarChartScope of(BuildContext context) {
    late VerticalBarChartScope scope;

    final InheritedWidget widget = context
        .getElementForInheritedWidgetOfExactType<VerticalBarChartScope>()!
        .widget as InheritedWidget;

    if (widget is VerticalBarChartScope) {
      scope = widget;
    }

    return scope;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
