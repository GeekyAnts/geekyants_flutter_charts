import 'package:flutter/material.dart';

// TODO: To Add all required parameters and functions.

class VerticalBarChartTitle extends LeafRenderObjectWidget {
  final double value;

  const VerticalBarChartTitle({
    super.key,
    required this.value,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderVerticalBarChartTitle(
      value: value,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderVerticalBarChartTitle renderObject) {
    renderObject.value = value;
  }
}

class RenderVerticalBarChartTitle extends RenderBox {
  double _value;

  RenderVerticalBarChartTitle({
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
