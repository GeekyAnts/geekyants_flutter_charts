import 'package:flutter/material.dart';

// TODO: To Add all required parameters and functions.

class BarChartLabel extends LeafRenderObjectWidget {
  final double value;

  const BarChartLabel({
    super.key,
    required this.value,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartLabel(
      value: value,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderBarChartLabel renderObject) {
    renderObject.value = value;
  }
}

class RenderBarChartLabel extends RenderBox {
  double _value;

  RenderBarChartLabel({
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
