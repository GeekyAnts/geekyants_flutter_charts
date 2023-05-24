import 'package:flutter/widgets.dart';

class BarChartTextTitle extends LeafRenderObjectWidget {
  final String text;
  final TextStyle textStyle;

  /// Creates a widget that displays a text title for a bar chart.
  ///
  /// The [text] parameter is the title text to be displayed.
  /// The [textStyle] parameter specifies the style of the title text.
  const BarChartTextTitle({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return BarChartTextTitleRenderObject(
      text: text,
      textStyle: textStyle,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    final barChartTextTitleRenderObject =
        renderObject as BarChartTextTitleRenderObject;
    barChartTextTitleRenderObject.text = text;
    barChartTextTitleRenderObject.textStyle = textStyle;
  }
}

class BarChartTextTitleRenderObject extends RenderBox {
  String text;
  TextStyle textStyle;

  /// Creates a render object that displays a text title for a bar chart.
  ///
  /// The [text] parameter is the title text to be displayed.
  /// The [textStyle] parameter specifies the style of the title text.
  BarChartTextTitleRenderObject({
    required this.text,
    required this.textStyle,
  });

  @override
  void performLayout() {
    final constraints = this.constraints;
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      maxWidth: constraints.maxWidth,
    );

    size = Size(constraints.maxWidth, textPainter.height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      maxWidth: size.width,
    );

    textPainter.paint(context.canvas, offset);
  }
}
