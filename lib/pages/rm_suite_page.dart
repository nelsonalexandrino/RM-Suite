import 'package:flutter/material.dart';

import '../charts/charts.dart';
import '../models/customer_chart_data.dart';
import '../charts/chart_new_customers.dart';
import '../charts/chart_actuals_performance.dart';

class RMSuiteHomePage extends StatefulWidget {
  @override
  _RMSuiteHomePageState createState() => _RMSuiteHomePageState();
}

class _RMSuiteHomePageState extends State<RMSuiteHomePage> {
  var _selectGraph = [true, false, false];

  List<ChartData> chartData;

  var data1 = <ChartData>[
    ChartData('Personal', 1744),
    ChartData('Prestige', 216),
    ChartData('Premier', 14),
    ChartData('SME', 67),
  ];
  var data2 = <ChartData>[
    ChartData('Personal', 306),
    ChartData('Prestige', 64),
    ChartData('Premier', 5),
    ChartData('SME', 3),
  ];
  var data3 = <ChartData>[
    ChartData('Personal', 40),
    ChartData('Prestige', 43),
    ChartData('Premier', 5),
    ChartData('SME', 3),
  ];

  @override
  void initState() {
    chartData = data1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFEBEFF2), //E2E8ED
      body: OrientationBuilder(
        builder: (context, orientation) => LayoutBuilder(
          builder: (context, constraints) {
            var greattings = (DateTime.now().hour < 12
                ? 'Bom dia!'
                : (DateTime.now().hour < 18 ? 'Boa tarde!' : 'Boa noite!'));
            return Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * .1,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: orientation == Orientation.portrait
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      greattings,
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.black.withOpacity(.8),
                                      ),
                                    ),
                                    Text(
                                      'bom trabalho!',
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.black.withOpacity(.8),
                                      ),
                                    )
                                  ],
                                )
                              : Text(
                                  '$greattings bom trabalho!',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black.withOpacity(.8),
                                  ),
                                ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.,
                            children: <Widget>[
                              ButtonTheme(
                                minWidth: 200,
                                height: 50,
                                child: RaisedButton.icon(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  textColor: Colors.green,
                                  icon: Icon(Icons.add),
                                  onPressed: () {},
                                  color: Color(0xFFE2F3EB),
                                  label: Text(
                                    'contas',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  elevation: 0,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ButtonTheme(
                                minWidth: 200,
                                height: 50,
                                //textTheme: ButtonTextTheme.,
                                child: RaisedButton.icon(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  textColor: Colors.teal,
                                  //textTheme: TextStyle,
                                  icon: Icon(Icons.add),
                                  onPressed: () {},
                                  color: Colors.teal.withOpacity(.20),
                                  label: Text(
                                    'deals',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  elevation: 0,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 45,
                                    width: 45,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        'assets/images/user.jpg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Container(),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * .5 + 64,
                    //color: Colors.amber,
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: orientation == Orientation.landscape
                              ? constraints.maxWidth / 2
                              : constraints.maxWidth,
                          height: orientation == Orientation.landscape
                              ? constraints.maxHeight * .45
                              : constraints.maxHeight * .45 / 2 + 64,
                          //color: Colors.black,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 8.0),
                                  child: ToggleButtons(
                                    borderWidth: 0,
                                    borderColor: Colors.white,
                                    disabledBorderColor: Colors.green,
                                    isSelected: _selectGraph,
                                    //borderRadius: BorderRadius.circular(30),
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text('With more than 50 MT'),
                                      ),
                                      Container(
                                        child: Text('With Loan'),
                                      ),
                                      Container(
                                        child: Text('With TD'),
                                      ),
                                    ],
                                    onPressed: (selected) {
                                      setState(() {
                                        _selectGraph
                                            .asMap()
                                            .forEach((index, value) {
                                          _selectGraph[index] = false;
                                        });
                                        _selectGraph[selected] = true;
                                        if (selected == 0) {
                                          chartData = data1;
                                        } else if (selected == 1) {
                                          chartData = data2;
                                        } else {
                                          chartData = data3;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  //padding: EdgeInsets.only(left: 10, top: 10),
                                  child: CustomerChart(chartData),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: orientation == Orientation.landscape
                              ? constraints.maxWidth / 4
                              : constraints.maxWidth / 2,
                          height: orientation == Orientation.landscape
                              ? constraints.maxHeight * .45
                              : constraints.maxHeight * .45 / 2 + 64,
                          //color: Colors.red,
                          child: Card(
                            child: getDefaultRadialBarChart(true),
                          ),
                        ),
                        Container(
                          width: orientation == Orientation.landscape
                              ? constraints.maxWidth / 4
                              : constraints.maxWidth / 2,
                          height: orientation == Orientation.landscape
                              ? constraints.maxHeight * .45
                              : constraints.maxHeight * .45 / 2 + 64,
                          //color: Colors.pink,
                          child: Card(
                            child: ActualsPerformanceChart(),
                          ),
                        ),
                        /* Container(
                          width: orientation == Orientation.landscape
                              ? constraints.maxWidth / 4
                              : constraints.maxWidth / 2,
                          height: orientation == Orientation.landscape
                              ? constraints.maxHeight * .45
                              : constraints.maxHeight * .45 / 2,
                          //color: Colors.brown,
                          child: Card(),
                        ), */
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
