import 'package:flutter/material.dart';
import 'package:geekyants_flutter_charts/geekyants_flutter_charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BarChart(
        title: BarChartTextTitle(
            text: 'Flutter Chart',
            textStyle: TextStyle(fontSize: 50, color: Colors.teal)),
        // barChartLegends: BarChartLegends(
        //   legendTextXAxis: "X-Axis",
        //   legendTextYAxis: "Y-Axis",
        //   legendTextXAxisStyle: TextStyle(color: Colors.black, fontSize: 15),
        //   legendTextYAxisStyle: TextStyle(color: Colors.black, fontSize: 15),
        //   legendXAxisColor: Colors.black,
        //   legendYAxisColor: Colors.black,
        //   legendPointerRadius: 6,
        // ),
        barChartAxis: BarChartAxis(
          //     xAxisLabelTextStyle: TextStyle(fontSize: 12, color: Colors.black),
          //     yAxisLabelTextStyle: TextStyle(fontSize: 12, color: Colors.black),
          //     xAxisRulerThickness: 2.0,
          //     xAxisRulerHeight: 135,
          //     yAxisRulerHeight: 200,
          //     yAxisRulerThickness: 1.0,
          //     xAxisRulerColor: Colors.deepOrangeAccent,
          //     yAxisRulerColor: Colors.purpleAccent,
          //     xAxisMainThickness: 1.3,
          //     yAxisMainThickness: 1.3,
          //     xAxisMainColor: Colors.deepPurpleAccent,
          //     yAxisMainColor: Colors.deepOrangeAccent,
          //     xAxisMainStrokeType: StrokeCap.square,
          //     yAxisMainStrokeType: StrokeCap.butt,
          xAxisStartPoint: 0,
          xAxisEndPoint: 5.5,
          //     yAxisStartPoint: 0,
          //     yAxisEndPoint: 100,
          // xAxisSteps: 90,
          //     yAxisSteps: 90,
          //     xAxisRulerOffset: 200,
          //     xAxisLabelOffset: 80,
          //     yAxisRulerOffset: 100,
          //     yAxisLabelOffset: 50,
          xAxisGridRulerThickness: 2.0,
          //     yAxisGridRulerThickness: 1.0,
          xAxisGridRulerColor: Colors.purple,
          //     yAxisGridRulerColor: Colors.orange,
          //     verticalBarColor: Colors.orange,
          // yAxisData: [
          // 1.5,
          // 0.6,
          // 4.8,
          // 5.0,
          // 2.2,
          // 1.8,
          // 0.3,
          // 4.2,
          // 5.2,
          // 2.5,
          // 3.3,
          //1.2
          // ],
          //     showXAxisGridRuler: false
          // showYAxisGridRuler: false,
        ),
      ),
    );
  }
}
