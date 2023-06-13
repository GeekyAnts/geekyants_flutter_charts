import 'package:flutter/material.dart';

class BarChartTextTitle extends LeafRenderObjectWidget {
  final String text;
  final TextStyle textStyle;

  /// Creates a widget that displays a text title for a bar chart.
  ///
  /// The [text] parameter is the title text to be displayed.
  /// The [textStyle] parameter specifies the style of the title text.
  const BarChartTextTitle(
      {Key? key,
      this.text = 'Flutter Chart Base',
      this.textStyle = const TextStyle(fontSize: 20, color: Colors.black)})
      : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return BarChartTextTitleRenderObject(
      renderText: text,
      renderTextStyle: textStyle,
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
  String renderText;
  TextStyle renderTextStyle;

  /// Creates a render object that displays a text title for a bar chart.
  ///
  /// The [text] parameter is the title text to be displayed.
  /// The [textStyle] parameter specifies the style of the title text.
  BarChartTextTitleRenderObject({
    required this.renderText,
    required this.renderTextStyle,
  });

  String get text => renderText;

  set text(String value) {
    if (renderText != value) {
      renderText = value;
      markNeedsLayout();
    }
  }

  TextStyle get textStyle => renderTextStyle;

  set textStyle(TextStyle value) {
    if (renderTextStyle != value) {
      renderTextStyle = value;
      markNeedsLayout();
    }
  }

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

    size = Size(textPainter.width, textPainter.height);
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
