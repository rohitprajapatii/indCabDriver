import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:indcabdriver/Intro/reg.dart';
import 'package:indcabdriver/Screens/home/home.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class otpVerify extends StatefulWidget {
  @override
  _otpVerifyState createState() => _otpVerifyState();
}

class _otpVerifyState extends State<otpVerify> {


  int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _getSignatureCode();
  }

  /// get signature code
  _getSignatureCode() async {
    String signature = await SmsRetrieved.getAppSignature();
    print("signature $signature");
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Verification OTP Code $_otpCode Success")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarName("Verify OTP"),

        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:22.0,vertical: 8),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 45,),
                        Text("Ask Customer for OTP to Start Trip"),



                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:48.0),
                          child: TextFieldPin(

                            filled: true,
                            filledColor: Colors.grey.shade50,
                            codeLength: _otpCodeLength,
                            boxSize: 46,
                            filledAfterTextChange: false,
                            textStyle: TextStyle(fontSize: 16),
                            borderStyle: OutlineInputBorder(
                              // borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(

                                    Radius.circular(5))),
                            onOtpCallback: (code, isAutofill) =>
                                _onOtpCallBack(code, isAutofill),
                          ),
                        ),



                      ],
                    ),




                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:25.0,left: 8,right: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonTheme(
                  minWidth: double.infinity,
                  height: 45,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: MyColors.themeClr,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => homePage()
                          ));
                    },
                    child: Text(
                      "Verify & start trip",
                      style: TextStyle(
                          fontSize: 16.0,fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
