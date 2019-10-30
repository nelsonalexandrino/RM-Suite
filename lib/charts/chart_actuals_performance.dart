import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/actuals_performance_data.dart';

class ActualsPerformanceChart extends StatefulWidget {
  @override
  _ActualsPerformanceChartState createState() =>
      _ActualsPerformanceChartState();
}

class _ActualsPerformanceChartState extends State<ActualsPerformanceChart> {
  @override
  Widget build(BuildContext context) {
    return getAngleRadialBarChart(false);
  }

  SfCircularChart getAngleRadialBarChart(bool isTileView) {
    return SfCircularChart(
      title: ChartTitle(text: isTileView ? '' : 'Activity tracker'),
      legend: Legend(
          isVisible: true,
          iconHeight: 20,
          iconWidth: 20,
          overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x'),
      series: getRadialBarSeries(isTileView),
    );
  }

  List<RadialBarSeries<RadialData, String>> getRadialBarSeries(
      bool isTileView) {
    final List<RadialData> chartData = <RadialData>[
      RadialData(
        'Actual 1',
        65,
        'Move  ',
        null,
        Color(0xFFf47721),
      ),
      RadialData(
        'Actual 2',
        43,
        'Exercise  ',
        null,
        Color(0xFFf15726),
      ),
      RadialData(
        'Actual 3',
        58,
        'Stand  ',
        null,
        Color(0xFFf52d28),
      ),
      RadialData(
        'Actual 4',
        58,
        'Stand  ',
        null,
        Color(0xFFdc0032),
      ),
      RadialData(
        'Actual 5',
        58,
        'Stand  ',
        null,
        Color(0xFF640032),
      ),
    ];
    var list = <RadialBarSeries<RadialData, String>>[
      RadialBarSeries<RadialData, String>(
          pointRadiusMapper: (RadialData data, _) => data.radius,
          maximumValue: 100,
          radius: '100%',
          gap: '2%',
          innerRadius: '30%',
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          xValueMapper: (RadialData data, _) => data.xVal,
          yValueMapper: (RadialData data, _) => data.yVal,
          pointColorMapper: (RadialData data, _) => data.color,
          dataLabelMapper: (RadialData data, _) => data.text,
          dataLabelSettings: DataLabelSettings(isVisible: true))
    ];
    return list;
  }
}
