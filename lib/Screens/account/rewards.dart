import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:flutter/services.dart';

class rewards extends StatefulWidget {
  @override
  _rewardsState createState() => _rewardsState();
}

class _rewardsState extends State<rewards> {


  bool isSwitched = false;
  bool _value = false;

  List<bool> _selected = List.generate(20, (i) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Refer and Earn"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                children: [
                    Image.asset("assets/reffer.png"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:20.0),
                      child: Text("Refer your friends and earn when\nhey join App",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black54),),
                    ),
                    Text("REFERRAL CODE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black54),),
                    // Text("Today, 22nd Oct",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 26,color: Colors.black54),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FDottedLine(
                        color: Colors.black,
                        strokeWidth: 2.0,
                        dottedLength: 8.0,
                        space: 3.0,
                        corner: FDottedLineCorner.all(6.0),

                        /// add widget
                        child: Container(
                          color: Colors.grey.shade200,
                          width: 150,
                          height: 45,
                          alignment: Alignment.center,
                          child: Text("Y  S  2  3  4  A",),
                        ),
                      ),
                    ),

                  new GestureDetector(
                    child: new CustomToolTip(text: "My Copyable Text"),
                    onTap: () {

                    },
                  ),
                ],
              ),
                  )),


              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:12.0),
                    child: Text("Status",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 14,backgroundColor: Colors.black,
                    child: Icon(Icons.done),
                  ),
                  trailing: Text("1",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  title:Text("ATTACHED REFFERALS",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                ),
              ),SizedBox(height: 4,),
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 14,backgroundColor: Colors.black,
                    child: Text("₹"),
                  ),
                  trailing: Text("₹ 150",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  title:Text("REFERRAL EARNING",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                ),
              ),SizedBox(height: 4,),
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 14,backgroundColor: Colors.black,
                    child: Icon(Icons.live_help_outlined),
                  ),
                  trailing: Text("5",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  title:Text("PENDING REFERRALS",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                ),
              ),SizedBox(height: 25,),

              Text(
                "We are working on schemes but\nyou can still refer your friends",textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),SizedBox(height: 25,),

              GestureDetector(
                onTap: (){
                  share();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("REFER NOW",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                ),
              ),

            ],
          ),
        ),
      ),


    );
  }


  Future<void> share() async {
    await FlutterShare.share(
      title: 'INDCAB Referal code, Pleaase install indcab app make better ride',
      linkUrl: 'https://www.indcabsonline.com/',

    );
  }
}



class CustomToolTip extends StatelessWidget {

  String text;

  CustomToolTip({this.text});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Tooltip(preferBelow: false,
          message: "Copy", child: new Text(text)),
      onTap: () {
        Clipboard.setData(new ClipboardData(text: text));
      },
    );
  }

}