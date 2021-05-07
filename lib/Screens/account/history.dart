import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import 'bankTransfer.dart';
import 'billDetails.dart';

class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history>with SingleTickerProviderStateMixin {



  List<bool> _selected = List.generate(20, (i) => false);

  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Earning History"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  height: 400,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints.expand(height: 50),
                          child: TabBar(
                              labelColor: MyColors.themeClr,
                              unselectedLabelColor: Colors.grey,

                              unselectedLabelStyle: TextStyle(fontSize: 16,
                                  color: Colors.grey),
                              indicatorWeight: 1.0,
                              indicatorColor: Colors.grey.shade200,
                              tabs: [
                                Tab(text: "Today",),
                                Tab(text: "Weekly"),
                              ]),
                        ),
                        Expanded(
                          child: Container(
                            child: TabBarView(children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Mon, 16 Nov’19",style: TextStyle(fontSize: 18),),SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text("₹ 5612",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                  ),SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text("15"),SizedBox(height: 5,),
                                          Text("Trips"),
                                        ],
                                      ),
                                      Container(width: 2,
                                        height: 60,
                                        color: Colors.grey,),
                                      Column(
                                        children: [
                                          Text("15:25"),SizedBox(height: 5,),
                                          Text("Online hrs"),
                                        ],
                                      ),
                                      Container(width: 2,
                                        height: 60,
                                        color: Colors.grey,),
                                      Column(
                                        children: [
                                          Text("₹ 315"),SizedBox(height: 5,),
                                          Text("Cash Trip"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0),
                                child: Column(
                                  children: [
                                    Text("Mon, 16 Nov’19",style: TextStyle(fontSize: 18),),SizedBox(height: 15,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("₹ 5612",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: BarChart(
                                          mainBarData(),
                                          swapAnimationDuration: animDuration,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text("15"),SizedBox(height: 5,),
                                            Text("Trips"),
                                          ],
                                        ),
                                        Container(width: 2,
                                          height: 60,
                                          color: Colors.grey,),
                                        Column(
                                          children: [
                                            Text("15:25"),SizedBox(height: 5,),
                                            Text("Online hrs"),
                                          ],
                                        ),
                                        Container(width: 2,
                                          height: 60,
                                          color: Colors.grey,),
                                        Column(
                                          children: [
                                            Text("₹ 315"),SizedBox(height: 5,),
                                            Text("Cash Trip"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child:ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context,int index){
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => billDetails()
                                  )
                              );

                            },
                            leading: Column(
                              children: [
                                SizedBox(height: 8,),
                                Text("3:32", style: new TextStyle(
                                  color: Colors.black,),),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   color: Colors.red[500],
                                    // ),
                                      borderRadius: BorderRadius.all(Radius.circular(8)),color: Colors.grey.shade200
                                  ),
                                  child: Text("PM", style: new TextStyle(
                                    color: Colors.black,),) ,
                                )
                              ],
                            ),
                            trailing:  Text("₹ 315",style: new TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),),
                            title: Text("Nemanli street", style: new TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),),
                            subtitle: Text(
                              "Paid by card", style: new TextStyle(
                                color: Colors.black45, fontSize: 14),),
                          ), Divider(),
                          ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => billDetails()
                                  )
                              );
                            },
                            leading: Column(
                              children: [
                                SizedBox(height: 8,),
                                Text("3:32", style: new TextStyle(
                                  color: Colors.black,),),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   color: Colors.red[500],
                                    // ),
                                      borderRadius: BorderRadius.all(Radius.circular(8)),color: Colors.grey.shade200
                                  ),
                                  child: Text("PM", style: new TextStyle(
                                    color: Colors.black,),) ,
                                )
                              ],
                            ),
                            trailing:  Text("₹ 315",style: new TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),),
                            title: Text("Nemanli street", style: new TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),),
                            subtitle: Text(
                              "Paid by Cash", style: new TextStyle(
                                color: Colors.black45, fontSize: 14),),
                          ),
                        ],
                      );
                    }
                ),


              ),
            ],
          ),
        ),
      ),


    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            // if (barTouchResponse.spot != null &&
            //     barTouchResponse.touchInput is! FlPanEnd &&
            //     barTouchResponse.touchInput is! FlLongPressEnd) {
            //   touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            // } else {
            //   touchedIndex = -1;
            // }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
          const TextStyle(
              color: MyColors.themeClr, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  List<BarChartGroupData> showingGroups() =>
      List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartGroupData makeGroupData(int x,
      double y, {
        bool isTouched = false,
        Color barColor = MyColors.themeClr,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}

