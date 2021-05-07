import 'package:flutter/material.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';


class billDetails extends StatefulWidget {
  @override
  _billDetailsState createState() => _billDetailsState();
}

class _billDetailsState extends State<billDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("INDCAB Ride Bill"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  one1('12-4-2021',16),
                  one1('02:25 PM',16),
                ],
              ),
              SizedBox(height: 15,),
              one1('Total Amount',16),
              Row(
                children: [
                  SizedBox(height: 8,),
                ],
              ),
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
              ),ListTile(
                leading: null,
                title: one1('commission charge ',14),
                trailing: one1('- ₹10.00',14),
              ),
              Divider(thickness: 2,color: Colors.green,),
              ListTile(
                leading: null,
                title: one1('You Earned amount',16),
                trailing: one1('₹146',16),
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
