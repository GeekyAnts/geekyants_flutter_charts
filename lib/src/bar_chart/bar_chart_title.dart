import 'package:flutter/widgets.dart';

/// A widget that provides a title for a bar chart.
///
/// This widget is used as an inherited widget, allowing descendant widgets to
/// access the [data] property provided by this widget.
class BarChartTitle extends InheritedWidget {
  /// The data string for the bar chart title.
  final String data;

  /// Creates a [BarChartTitle].
  ///
  /// The [data] parameter is required and represents the data string for the
  /// bar chart title. The [child] parameter is required and represents the
  /// child widget that this inherited widget wraps.
  const BarChartTitle({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Retrieves the closest [BarChartTitle] instance from the given [context].
  ///
  /// This method is commonly used by descendant widgets to obtain the
  /// [BarChartTitle] instance and access its [data] property.
  ///
  /// Example usage:
  /// ```dart
  /// final title = BarChartTitle.of(context)?.data;
  /// ```
  static BarChartTitle? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BarChartTitle>();
  }

  @override
  bool updateShouldNotify(BarChartTitle oldWidget) {
    return data != oldWidget.data;
  }
}

class BarChartTitleText extends StatelessWidget {
  // final double textScaleFactor;
  // const BarChartTitleText({super.key, this.textScaleFactor = 12.0});
  const BarChartTitleText({super.key});
  @override
  Widget build(BuildContext context) {
    final inheritedWidget = BarChartTitle.of(context);

    return Text(
      inheritedWidget?.data ?? 'No data',
      // style: TextStyle(fontSize: textScaleFactor),
    );
  }
}
