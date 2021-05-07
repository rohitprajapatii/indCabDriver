import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class bankTrasfer extends StatefulWidget {
  @override
  _bankTrasferState createState() => _bankTrasferState();
}

class _bankTrasferState extends State<bankTrasfer> {

  bool isSwitched = false;
  bool _value = false;

  List<bool> _selected = List.generate(20, (i) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appbarName("Bank Transfer"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Today, 22nd Oct",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 26,color: Colors.black54),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:12.0),
                child: Text("₹ 656",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 48,color: Colors.black),),
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.grey.shade300,
                  textColor: Colors.black54,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timelapse),SizedBox(width: 8,),
                      Text(
                        "No balance to be paid",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:15),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 15),
                  child: Column(
                    children: [
                      ListTile(
                        trailing: Text("₹ 0",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                        title:Text("Total Earnings (21 Oct)",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      ),Divider(thickness: 1,),
                      ListTile(
                        trailing: Text("₹ 0",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                        title:Text("Cash Collected",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      ),
                      ListTile(
                        trailing: Text("₹ 0",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                        title:Text("Carry Forward",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                        subtitle:Text("From Tue, 20thOct",style: new TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w400),),
                      ),
                      Divider(thickness: 3,color: Colors.black,),
                      ListTile(
                        trailing: Text("₹ 5640",style: new TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w400),),
                        title:Text("Balance",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
