import 'package:flutter/material.dart';
import 'package:geekyants_flutter_charts/src/bar_chart/bar_chart_scope.dart';

import 'bar_chart_axes.dart';
import 'bar_chart_painter.dart';

class BarChart extends StatefulWidget {
  const BarChart({Key? key, this.barChartAxes = const BarChartAxes()})
      : super(key: key);

  final BarChartAxes barChartAxes;

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  late List<Widget> _barChartWidgets;

  /// init state to initialize the variable
  ///
  @override
  void initState() {
    super.initState();
    _barChartWidgets = <Widget>[];
  }

  void _addChild(Widget child) {
    _barChartWidgets.add(BarChartScope(child: child));
  }

  List<Widget> _buildChildWidgets(BuildContext context) {
    _barChartWidgets.clear();
    _addChild(widget.barChartAxes);
    return _barChartWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return RBarChartRenderer(
      barChart: widget,
      children: _buildChildWidgets(context),
    );
  }
}

class RBarChartRenderer extends MultiChildRenderObjectWidget {
  RBarChartRenderer({Key? key, this.barChart, required List<Widget> children})
      : super(key: key, children: children);

  final BarChart? barChart;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRBarChart();
  }

  @override
  void updateRenderObject(BuildContext context, RenderRBarChart renderObject) {
    super.updateRenderObject(context, renderObject);
  }
}

// TODO: For testing the mock logic for chart view uncommand below and run the code

// class BarChart extends StatefulWidget {
//   const BarChart({Key? key}) : super(key: key);

//   @override
//   State<BarChart> createState() => _BarChartState();
// }

// class _BarChartState extends State<BarChart> {
//   @override
//   Widget build(BuildContext context) {
//     // return CustomPaint(
//     //   painter: BarChartPainter(),
//     //   size: Size(MediaQuery.of(context).size.width, 600),
//     // );
//   }
// }

// class RBarChartRenderer extends MultiChildRenderObjectWidget {
//   const RBarChartRenderer({Key? key, required List<Widget> children})
//       : super(key: key, children: children);

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderRBarChart();
//   }

//   @override
//   void updateRenderObject(BuildContext context, RenderRBarChart renderObject) {
//     super.updateRenderObject(context, renderObject);
//   }
// }

// class BarChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final double chartWidth = size.width - 10.0 * 6;
//     final double chartHeight = size.height;
//     final double chartTop = (size.height - chartHeight) / 2;
//     final double chartLeft = (size.width - chartWidth) / 2;
//     const int numAxisPoints = 10;
//     final double barWidth = chartWidth / numAxisPoints;

//     final Paint axisPaint = Paint()
//       ..color = Colors.grey
//       ..strokeWidth = 0.5
//       ..strokeCap = StrokeCap.round;

//     // Draw x-axis points
//     for (int i = 0; i <= numAxisPoints; i++) {
//       final double x = chartLeft + i * barWidth;
//       canvas.drawLine(
//         Offset(x, chartTop + chartHeight + 5),
//         Offset(x, chartTop),
//         axisPaint,
//       );
//       TextSpan span = TextSpan(
//         text: '${i * 0.5}',
//         style: const TextStyle(color: Colors.black, fontSize: 12),
//       );
//       TextPainter tp = TextPainter(
//         text: span,
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.ltr,
//       );
//       tp.layout();

//       // calculate position of ruler text
//       double rulerTextTop = chartTop + chartHeight + 8;
//       double rulerTextLeft = x - tp.width / 2;

//       // adjust position of ruler text if it is too close to y-axis
//       if (rulerTextLeft < chartLeft) {
//         rulerTextLeft = chartLeft;
//       }

//       tp.paint(canvas, Offset(rulerTextLeft, rulerTextTop));
//     }

//     // Draw y-axis points
//     for (int i = 0; i <= numAxisPoints; i++) {
//       final double y = chartTop + chartHeight - i * chartHeight / numAxisPoints;
//       canvas.drawLine(
//         Offset(chartLeft - 5, y),
//         Offset(chartLeft + chartWidth, y),
//         axisPaint,
//       );
//       TextSpan span = TextSpan(
//         text: '${i * 0.5}',
//         style: const TextStyle(color: Colors.black, fontSize: 12),
//       );
//       TextPainter tp = TextPainter(
//         text: span,
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.ltr,
//       );
//       tp.layout();
//       tp.paint(canvas, Offset(chartLeft - tp.width - 8, y - tp.height / 2));
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
