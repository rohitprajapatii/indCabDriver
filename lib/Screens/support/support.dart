import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/constants.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';


class support extends StatefulWidget {
  @override
  _supportState createState() => _supportState();
}

class _supportState extends State<support> {

  Future<void> send() async {
    final Email email = Email(
      body: 'hai INDCAB',
      subject: 'hello',
      recipients: ['example@example.com'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,

    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
  final cnst=constant();

  List<bool> _selected = List.generate(20, (i) => false);
  List<String> _title = ["App not working","Nearby demand Areas","Suraksha-Safety zone","Status of my city"];
  List<String> _icons = ["smartphone.svg","nearby.svg","surface1.svg","Group.svg",];

  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName1("Support"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: MyColors.themeClr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Support Center", style: new TextStyle(color: Colors.white, fontSize: 22)),
                        Text("Select an issue you might haver",style: new TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                SizedBox(height: 15,),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 8.0 / 8.0,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.all(5),
                          child: Card(
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(_title[index],
                                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                        )),SizedBox(height: 8,),
                                    SvgPicture.asset("assets/incentive/${_icons[index]}",height: 80,width: 100,),

                                  ],
                                ),
                              )));
                    },
                  )

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:60.0,bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){
                      cnst.makePhoneCall("tel://987654320");
                  },
                    child: CircleAvatar(
                      backgroundColor: MyColors.themeClr,
                      radius: 33,
                      child:  SvgPicture.asset("assets/incentive/24-hours.svg",height:45 ,width: 45,),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:33.0),
                    child: GestureDetector(
                      onTap:()  {
                        send();
                      },
                      child: CircleAvatar(
                        backgroundColor: MyColors.themeClr,
                        radius: 33,
                        child:  SvgPicture.asset("assets/incentive/email.svg",height:45 ,width: 45,),

                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      cnst.launchInBrowser('https://www.indcabsonline.com/');
                    },
                    child: CircleAvatar(
                      backgroundColor: MyColors.themeClr,
                      radius: 33,
                      child:  SvgPicture.asset("assets/incentive/semantic-web.svg",height:45 ,width: 45,),

                    ),
                  ),

                ],
              ),
            ),
            Center(
              child: Text("Our team persons will contact\nyou soon!",textAlign: TextAlign.center, style: new TextStyle(
                fontSize: 22,color: Colors.black,),),
            ),


          ],
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

