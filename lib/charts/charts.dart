import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

SfCircularChart getDefaultRadialBarChart(bool isTileView) {
  return SfCircularChart(
    title: ChartTitle(
      text: isTileView ? 'Contas abertas' : '',
      borderWidth: 15,
    ),
    series: getRadialBarDefaultSeries(isTileView),
    tooltipBehavior:
        TooltipBehavior(enable: true, format: 'point.x : point.ym'),
    //backgroundImage: AssetImage('assets/images/user.jpg'),
    //centerX: 'Nelson',
    annotations: [
      CircularChartAnnotation(
          angle: 0,
          radius: '0%',
          height: '90%',
          width: '90%',
          child: Center(
            child: const Text(
              '57%',
              style: TextStyle(fontSize: 24),
            ),
          ))
    ],
  );
}

List<RadialBarSeries<_RadialData, String>> getRadialBarDefaultSeries(
    bool isTileView) {
  final List<_RadialData> chartData = <_RadialData>[
    _RadialData('', 10, '100%', Colors.amber),
    //_RadialData('John', 10, '100%', Color.fromRGBO(248, 177, 149, 1.0)),
    //_RadialData('Almaida', 11, '100%', Color.fromRGBO(246, 114, 128, 1.0)),
    //_RadialData('Doe', 12, '100%', Color.fromRGBO(61, 205, 171, 1.0)),
    //_RadialData('Tom', 13, '100%', Color.fromRGBO(1, 174, 190, 1.0)),
  ];
  return <RadialBarSeries<_RadialData, String>>[
    RadialBarSeries<_RadialData, String>(
        maximumValue: 15,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle: ChartTextStyle(fontSize: 10.0),
        ),
        dataSource: chartData,
        cornerStyle: CornerStyle.bothCurve,
        gap: '10%',
        radius: '90%',
        innerRadius: '80%',
        xValueMapper: (_RadialData data, _) => data.xVal,
        yValueMapper: (_RadialData data, _) => data.yVal,
        pointRadiusMapper: (_RadialData data, _) => data.radius,
        pointColorMapper: (_RadialData data, _) => data.color,
        dataLabelMapper: (_RadialData data, _) => data.xVal)
  ];
}

class _RadialData {
  _RadialData(this.xVal, this.yVal, [this.radius, this.color]);
  final String xVal;
  final double yVal;
  final String radius;
  final Color color;
}
