import 'package:flutter/material.dart';
import 'package:flutter_otp/flutter_otp.dart';


FlutterOtp otp = FlutterOtp();
String result;
int enteredOtp;

class HomeScreen1 extends StatefulWidget {
  @override // manip5595@gmail.com//
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen1> {
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    bool yesOrNo = otp.resultChecker(enteredOtp);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Text('Enter Phone:'),
                TextField(
                  onChanged: (val) {
                    phoneNumber = val;
                  },
                ),
                RaisedButton(
                  child: Text('SEND OTP'),
                  onPressed: () {
                    otp.sendOtp(phoneNumber);
                  },
                ),
                Text('Enter OTP sent to your phone'),
                TextField(
                  onChanged: (val) {
                    enteredOtp = int.parse(val);
                  },
                ),
                RaisedButton(
                  child: Text('VERIFY'),
                  onPressed: () {
                    setState(() {
                      bool yesOrNo = otp.resultChecker(enteredOtp);
                      print(yesOrNo);
                    });
                  },
                ),
                Center(
                  child: Text(yesOrNo.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
