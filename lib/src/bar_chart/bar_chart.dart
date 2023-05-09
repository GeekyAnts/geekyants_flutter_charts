import 'package:flutter/material.dart';

import 'bar_chart_painter.dart';

// TODO: To Add all required parameters and functions.
class BarChart extends StatefulWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class RBarChartRenderer extends MultiChildRenderObjectWidget {
  const RBarChartRenderer({Key? key, required List<Widget> children})
      : super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRBarChart();
  }

  @override
  void updateRenderObject(BuildContext context, RenderRBarChart renderObject) {
    super.updateRenderObject(context, renderObject);
  }
}
