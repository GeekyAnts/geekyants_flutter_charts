import 'package:flutter/material.dart';

// TODO: To Add all required parameters and functions.

class BarChartAxes extends LeafRenderObjectWidget {
  final double value;

  const BarChartAxes({
    super.key,
    required this.value,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartAxes(
      value: value,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderBarChartAxes renderObject) {
    renderObject.value = value;
  }
}

class RenderBarChartAxes extends RenderBox {
  double _value;

  RenderBarChartAxes({
    required double value,
  }) : _value = value;

  double get value => _value;
  set value(double value) {
    if (_value == value) return;
    _value = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    // Implement layout here
    super.performLayout();
  }
}
