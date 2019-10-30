import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/customer_chart_data.dart';

class CustomerChart extends StatefulWidget {
  List<ChartData> chartData;

  CustomerChart(this.chartData);
  @override
  _CustomerChartState createState() => _CustomerChartState();
}

class _CustomerChartState extends State<CustomerChart> {
  @override
  Widget build(BuildContext context) {
    return getUpdateDataSourceChart(false, widget.chartData);
  }

  SfCartesianChart getUpdateDataSourceChart(bool isTileView,
      [List<ChartData> chartData]) {
    return SfCartesianChart(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 30,
        bottom: 10,
      ),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        //rangePadding: ChartRangePadding.round,
        //minimum: 0,
        //interval: 1,
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.round,
        //axisLine: AxisLine(width: 0),
        //majorTickLines: MajorTickLines(size: 0),
        //minorGridLines: MinorGridLines(width: 0),
        isVisible: false,
        axisLine: AxisLine(
          //width: 0,
          color: Colors.white,
        ),
      ),
      series: _getColumnSeries(),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        header: '',
        canShowMarker: false,
      ),
    );
  }

  List<ColumnSeries<ChartData, String>> _getColumnSeries() {
    return <ColumnSeries<ChartData, String>>[
      ColumnSeries<ChartData, String>(
        //spacing: 0.4,
        width: 0.5,
        color: Color(0xFF640032),
        dataSource: widget.chartData,
        xValueMapper: (ChartData sales, _) => sales.segment,
        yValueMapper: (ChartData sales, _) => sales.accounts,
        isVisible: true,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ];
  }
}
