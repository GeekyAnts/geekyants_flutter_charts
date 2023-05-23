import 'package:flutter/material.dart';

/// A widget that provides a scope for the BarChart widget.
///
/// This widget is an [InheritedWidget], which allows descendant widgets to
/// obtain the [BarChartScope] instance using the [of] method.
class BarChartScope extends InheritedWidget {
  /// Creates a [BarChartScope] widget.
  ///
  /// The [child] parameter is required and represents the child widget
  /// that will have access to the [BarChartScope].
  ///
  final double? fontSize;
  const BarChartScope({required Widget child, Key? key, this.fontSize})
      : super(key: key, child: child);

  /// Retrieves the nearest [BarChartScope] instance from the given [context].
  ///
  /// Throws an error if no [BarChartScope] instance is found in the widget
  /// tree above the given [context].
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
