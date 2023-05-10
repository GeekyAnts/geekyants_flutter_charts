import 'package:flutter/material.dart';

// TODO: To Add all required parameters and functions.

class BarChartTitle extends LeafRenderObjectWidget {
  final double value;

  const BarChartTitle({
    super.key,
    required this.value,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartTitle(
      value: value,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderBarChartTitle renderObject) {
    renderObject.value = value;
  }
}

class RenderBarChartTitle extends RenderBox {
  double _value;

  RenderBarChartTitle({
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
