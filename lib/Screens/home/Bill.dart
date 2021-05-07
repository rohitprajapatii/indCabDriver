import 'package:flutter/material.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class billCheck extends StatefulWidget {
  @override
  _billCheckState createState() => _billCheckState();
}

class _billCheckState extends State<billCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("INDCAB Ride Bill"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              one1('Total Amount',16),
              SizedBox(height: 8,),
              one1('₹ 156',46),
              SizedBox(height: 8,),
              one1('Total distance : 10.25 KM',16),
              SizedBox(height: 8,),
              one1('Total Ride Time: 35 mins',16),
              SizedBox(height: 15,),
              Container(
                color: Colors.grey,
                  height: 30,
                  child: Center(child: Text("Bill Breakup",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))
                  )),
              ListTile(
                leading: null,
                title: one1('Rate for KM ',14),
                trailing: one1('₹ 12',14),
              ), ListTile(
                leading: null,
                title: one1('Tax Charge ',14),
                trailing: one1('₹12',14),
              ),ListTile(
                leading: null,
                title: one1('Discount ',14),
                trailing: one1('₹12',14),
              ),ListTile(
                leading: null,
                title: one1('Toll Charge ',14),
                trailing: one1('₹0.00',14),
              ),
              Divider(),
              ListTile(
                leading: null,
                title: one1('Total payed amount ',16),
                trailing: one1('₹156',16),
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text('Okay',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('_getRide',  true);
                        prefs.commit();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext ctx) => homePage()
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  one1(String s,double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:6.0),
      child: Text(s,style: TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: Colors.black))
    );
  }
}
