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
        barChartLabel: BarChartLabel(
            // showRulerGrid: false,
            // xAxisRulerThickness: 2.0,
            // xAxisRulerHeight: 35,
            // yAxisRulerThickness: 1.0,
            // xAxisRulerColor: Colors.deepOrangeAccent,
            // yAxisRulerColor: Colors.purpleAccent,
            // xAxisMainThickness: 1.3,
            // yAxisMainThickness: 1.3,
            // xAxisMainColor: Colors.deepPurpleAccent,
            // yAxisMainColor: Colors.deepOrangeAccent,
            // xAxisStartPoint: 10,
            // xAxisEndPoint: 55,
            // yAxisStartPoint: 20,
            // yAxisEndPoint: 120,
            // xAxisSteps: 90,
            // yAxisSteps: 90,
            // yAxisLabelTextStyle: TextStyle(fontSize: 12, color: Colors.teal),
            // xAxisLabelTextStyle:
            //     TextStyle(fontSize: 12, color: Colors.purpleAccent),
            ),
      ),
    );
  }
}
