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
        barChartAxis: BarChartAxis(
            legendTextXAxis: "X-Axis Data",
            legendTextYAxis: "Y-Axis Data",
            legendTextXAxisStyle: TextStyle(color: Colors.black, fontSize: 20),
            legendTextYAxisStyle: TextStyle(color: Colors.black, fontSize: 20),
            legendXAxisColor: Colors.blue,
            legendYAxisColor: Colors.black,
            // xAxisLabelTextStyle: TextStyle(fontSize: 12, color: Colors.black),
            // yAxisLabelTextStyle: TextStyle(fontSize: 12, color: Colors.black),
            // xAxisRulerThickness: 2.0,
            // xAxisRulerHeight: 135,
            // yAxisRulerHeight: 200,
            // yAxisRulerThickness: 1.0,
            // xAxisRulerColor: Colors.deepOrangeAccent,
            // yAxisRulerColor: Colors.purpleAccent,
            // xAxisMainThickness: 1.3,
            // yAxisMainThickness: 1.3,
            // xAxisMainColor: Colors.deepPurpleAccent,
            // yAxisMainColor: Colors.deepOrangeAccent,
            // xAxisMainStrokeType: StrokeCap.square,
            // yAxisMainStrokeType: StrokeCap.butt,
            // xAxisStartPoint: 0,
            // xAxisEndPoint: 55,
            yAxisStartPoint: 0,
            yAxisEndPoint: 100,
            // xAxisSteps: 90,
            // yAxisSteps: 90,
            // xAxisRulerOffset: 200,
            // xAxisLabelOffset: 80,
            // yAxisRulerOffset: 100,
            // yAxisLabelOffset: 50,
            // xAxisGridRulerThickness: 2.0,
            // yAxisGridRulerThickness: 1.0,
            // xAxisGridRulerColor: Colors.black,
            // yAxisGridRulerColor: Colors.orange,
            verticalBarColor: Colors.orange,
            // yAxisData: [1.5, 0.6, 4.8, 60, 1.4, 20, 20, 70, 0.2, 2.8, 5.3, 2.2],
            showXAxisGridRuler: false),
      ),
    );
  }
}
