import 'package:flutter/material.dart';
import 'package:geekyants_flutter_charts/geekyants_flutter_charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class ChartSampleData {
  ChartSampleData({
    required this.xValue,
    required this.yValue,
    required this.secondSeriesYValue,
    this.thirdSeriesYValue,
  });
  final double xValue;
  final double yValue;
  final int secondSeriesYValue;
  final int? thirdSeriesYValue;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    super.initState();
    chartData = <ChartSampleData>[
      ChartSampleData(xValue: 1, yValue: 240, secondSeriesYValue: 236),
      ChartSampleData(xValue: 2, yValue: 250, secondSeriesYValue: 242),
      ChartSampleData(xValue: 3, yValue: 281, secondSeriesYValue: 313),
      ChartSampleData(xValue: 4, yValue: 358, secondSeriesYValue: 359),
      ChartSampleData(xValue: 5, yValue: 237, secondSeriesYValue: 272)
    ];
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List<ColumnSeries<ChartSampleData, num>> getDefaultNumericSeries() {
    return <ColumnSeries<ChartSampleData, num>>[
      ///first series named "Australia".
      ColumnSeries<ChartSampleData, num>(
          dataSource: chartData!,
          color: const Color.fromRGBO(237, 221, 76, 1),
          name: 'Australia',
          xValueMapper: (ChartSampleData sales, _) => sales.xValue as num,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue),

      ///second series named "India".
      ColumnSeries<ChartSampleData, num>(
          dataSource: chartData!,
          color: const Color.fromRGBO(2, 109, 213, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.xValue as num,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'India'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SfCartesianChart(
          title: ChartTitle(text: 'Tourism - Number of arrivals'),
          legend: Legend(isVisible: true),
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
          ),
          series: getDefaultNumericSeries(),
          tooltipBehavior: TooltipBehavior(enable: true),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
