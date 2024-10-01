import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true, format: 'point.x : point.y%');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: const Legend(
        isVisible: true,
        textStyle: TextStyle(color: Colors.white60),
        position: LegendPosition.bottom,
        overflowMode: LegendItemOverflowMode.wrap,
        isResponsive: true,
      ),
      enableMultiSelection: true,
      tooltipBehavior: _tooltip,
      series: <DoughnutSeries<_ChartData, String>>[
        DoughnutSeries<_ChartData, String>(
          dataSource: getChartData(),
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          innerRadius: '50%',
          explode: true,
        ),
      ],
    );
  }

  // Sample chart data
  List<_ChartData> getChartData() {
    return [
      _ChartData('In Progress', 10),
      _ChartData('Completed', 30),
      _ChartData('Next Due', 25),
      _ChartData('Total', 20),
      _ChartData("In Registration", 20)
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
