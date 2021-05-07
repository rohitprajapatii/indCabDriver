import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indcabdriver/Intro/firstPage.dart';
import 'package:indcabdriver/Intro/login.dart';
import 'package:indcabdriver/Screens/profile/pay.dart';
import 'package:indcabdriver/Screens/profile/performance.dart';
import 'package:indcabdriver/Screens/profile/settings.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/constants.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProfileEdit.dart';
import 'deposit.dart';
import 'documents.dart';
import 'kyc.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {

  String _name ="";
  final cnst=constant();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName1("Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => profileEdit(data: _name,)
                        )
                    );
                  },
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/profile/user.svg",height:115 ,width: 15,),SizedBox(width: 51,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$_name", style: new TextStyle(fontSize: 16,color: Colors.black,),),SizedBox(height: 8,),
                          Text("Manage Profile", style: new TextStyle(fontSize: 16,color: MyColors.themeClr,),),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => performance()
                    )
                );
              },
              leading:SvgPicture.asset("assets/profile/star.svg",height:28 ,width: 28,),
              title: Text("Performance", style: new TextStyle(fontSize: 16,color: MyColors.black,),),

            ), Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => kyc()
                    )
                );
                },
              leading:SvgPicture.asset("assets/profile/customer.svg",height:28 ,width: 28,),
              title: Text("Customer KYC verification", style: new TextStyle(fontSize: 16,color: MyColors.black,),),
            ),Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => documents()
                    )
                );
                },
              leading:SvgPicture.asset("assets/profile/car-insurance.svg",height:28 ,width: 28,),
              title: Text("Vehicle Documents", style: new TextStyle(fontSize: 16,color: MyColors.black,),),

            ), Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => deposit()
                )
                );
          },
              leading:SvgPicture.asset("assets/profile/deposit.svg",height:28 ,width: 28,),
              title: Text("Deposit Cash", style: new TextStyle(fontSize: 16,color: MyColors.black,),),
            ),Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => settings()//payOnline()
                    )
                );
                },
              leading:SvgPicture.asset("assets/profile/settings.svg",height:28 ,width: 28,),
              title: Text("Settings", style: new TextStyle(fontSize: 16,color: MyColors.black,),),

            ), Divider(),
            ListTile(
              onTap: () {
                showAlertDialog(context);

              },
              leading:SvgPicture.asset("assets/profile/power.svg",height:28 ,width: 28,),
              title: Text("Log-out", style: new TextStyle(fontSize: 16,color: MyColors.black,),),
            ),Divider(),
            ListTile(
              onTap: () {
                cnst.makePhoneCall("tel://987654320");
              },
              leading:SvgPicture.asset("assets/profile/sos.svg",height:28 ,width: 28),
              title: Text("Call for Emergency", style: new TextStyle(fontSize: 16,color: Colors.red,),),
            ),


          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Confirmation"),
            content: Text("Are you sure you want to Log-Out?"),
            actions: <Widget>[
              CupertinoDialogAction(
              isDefaultAction: true,

                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")
              ),
              CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('login', false);
                    await prefs.setString('DUTY', "OFF DUTY");
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => firstPage() //payOnline()
                        )
                    );
                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    // prefs.remove('isLogin');
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
                  },
                  child: Text("Ok")
              ),
            ],
          );
        });
  }

  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = await prefs.getString('Name'?? "");

  }

}
