// import 'dart:async';
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:indcabdriver/Intro/reg.dart';
// import 'package:indcabdriver/Screens/home/home.dart';
// import 'package:indcabdriver/widgets/appbarCustome.dart';
// import 'package:indcabdriver/widgets/custumColors.dart';
// import 'package:msg91_sms_otp/msg91_sms_otp.dart';
// import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
//
// class otp extends StatefulWidget {
//   @override
//   _otpState createState() => _otpState();
// }
//
// class _otpState extends State<otp> {
//
//   // SMSClient cli;
//   // SMSClient cli1;
//   // int _otpCodeLength = 6;
//   // bool _isLoadingButton = false;
//   // bool _enableButton = false;
//   // String _otpCode = "";
//   // final _scaffoldKey = GlobalKey<ScaffoldState>();
//   //
//   // String key = "154111AHI06o2JTi5ff040b6P1";
//   // String sender = "TESTIN";
//   // int otpsize = 6;
//   //
//   //
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   List phno = ["9538155640","8431611968"];
//   //   SMSClient(key,"9538155640",);
//   //   print("bbbbbbbbbb");
//   //
//   //   String message = "hi! this is a test message";
//   //   cli.sendMessgae(message,phno);
//   //   print("oooo");
//   //
//   //  var phno1 = ["9538155640"];
//   //   cli.sendOtp(phno1);
//   //   print("llllllll");
//   //   _getSignatureCode();
//   // }
//   //
//   // /// get signature code
//   // _getSignatureCode() async {
//   //   String signature = await SmsRetrieved.getAppSignature();
//   //   print("signature $signature");
//   // }
//   //
//   // _onSubmitOtp() {
//   //   setState(() {
//   //     _isLoadingButton = !_isLoadingButton;
//   //     _verifyOtpCode();
//   //   });
//   // }
//   //
//   // _onOtpCallBack(String otpCode, bool isAutofill) {
//   //   setState(() {
//   //     this._otpCode = otpCode;
//   //     if (otpCode.length == _otpCodeLength && isAutofill) {
//   //       _enableButton = false;
//   //       _isLoadingButton = true;
//   //       _verifyOtpCode();
//   //     } else if (otpCode.length == _otpCodeLength && !isAutofill) {
//   //       _enableButton = true;
//   //       _isLoadingButton = false;
//   //     } else {
//   //       _enableButton = false;
//   //     }
//   //   });
//   // }
//   //
//   // _verifyOtpCode() {
//   //   FocusScope.of(context).requestFocus(new FocusNode());
//   //   Timer(Duration(milliseconds: 4000), () {
//   //     setState(() {
//   //       _isLoadingButton = false;
//   //       _enableButton = false;
//   //     });
//   //
//   //     _scaffoldKey.currentState.showSnackBar(
//   //         SnackBar(content: Text("Verification OTP Code $_otpCode Success")));
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: appbarName("OTP"),
//
//         body: Container(
//           height: MediaQuery.of(context).size.height,
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal:22.0,vertical: 8),
//             child: Stack(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 45,),
//                     Text("Phone Verification"),
//                     SizedBox(height: 8,),
//                     Text("Enter your OTP code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
//                     SizedBox(height: 25,),
//                     RichText(
//                       text: TextSpan(
//                           text: 'Enter the 4-digit code sent to you at +91-9109990000',
//                           style: TextStyle(
//                               color: Colors.black, fontSize: 14),
//                           children: <TextSpan>[
//                             TextSpan(text: ' Did you enter the correct number?',
//                                 style: TextStyle(
//                                     color: Color(0xff247B1C), fontSize: 14,fontWeight: FontWeight.bold),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(builder: (_) => registration()//homePage()
//                                         ));
//                                   }
//                             )
//                           ]
//                       ),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical:48.0),
//                       child: TextFieldPin(
//                         filled: true,
//                         filledColor: Colors.grey.shade50,
//                         codeLength: _otpCodeLength,
//                         boxSize: 46,
//                         filledAfterTextChange: false,
//                         textStyle: TextStyle(fontSize: 16),
//                         borderStyle: OutlineInputBorder(
//                             // borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//
//                                 Radius.circular(5))),
//                         onOtpCallback: (code, isAutofill) =>
//                             _onOtpCallBack(code, isAutofill),
//                       ),
//                     ),
//
//                     Text("Resend Code in 10 seconds",style: TextStyle(
//                       color: Color(0xff247B1C), fontSize: 14,)),
//                     SizedBox(height: 40,),
//                     ButtonTheme(
//                       minWidth: double.infinity,
//                       height: 40,
//                       child: FlatButton(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         color: MyColors.themeClr,
//                         textColor: Colors.white,
//                         padding: EdgeInsets.all(8.0),
//                         onPressed: () {
//                           Navigator.of(context).push(
//                               MaterialPageRoute(builder: (_) => homePage()
//                               ));
//                         },
//                         child: Text(
//                           "Continue".toUpperCase(),
//                           style: TextStyle(
//                               fontSize: 16.0,fontWeight: FontWeight.bold
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//
//
//
//
//               ],
//             ),
//           ),
//         ));
//   }
// }


import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:indcabdriver/Intro/reg.dart';
import 'package:indcabdriver/Network/apiService/api_service.dart';
import 'package:indcabdriver/Network/response/login_result.dart';
import 'package:indcabdriver/Screens/home/home.dart';
import 'package:indcabdriver/widgets/constants.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

import 'package:http/http.dart' as http;



class otp extends StatefulWidget {
  final String phone;
  otp(this.phone);
  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;

  final _APIservice = ApiService(Dio());
  final cnst=constant();

  int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var _firebaseUser =  FirebaseAuth.instance;

  String _status;

  AuthCredential _phoneAuthCredential;
  String _verificationId;
  String _code="";


  Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }






  void _VerifyOTP() async {
    setState(() {
      _isLoading = true;
    });
    try{
      var request = http.MultipartRequest('POST', Uri.parse('Replace this API'));
      request.fields.addAll({
        'phone': widget.phone.toString(),
        'otp':_otpCode,
      });


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        one();

        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }
    }on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      // throw e;
      print("ppppppppppppp $e");
    }
  }


  _verifyPhone() async {
    print("firebase");
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {

              print("oneeeeeeeeeeeeee");

              one();
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // // bool _login = (prefs.getBool('login') ?? true);
              // await prefs.setBool('login', true);
              // await prefs.setString('userID',"response.response.data['token']" );
              // print("token");
              //
              //
              // var response = await _APIservice.userLogin(widget.phone);
              //
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => homePage()),
              //         (route) => false);
              // cnst.successToast("Login Successfully, ",context);

            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }






  _onOtpCallBack(String otpCode, bool isAutofill) {

    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _VerifyOTP();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "OTP",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
          ),
        ),
        body: LoadingOverlay(
          isLoading: _isLoading,
          // demo of some additional parameters
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:22.0,vertical: 8),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 45,),
                            Text("Phone Verification"),
                            SizedBox(height: 8,),
                            Text("Enter your OTP code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                            SizedBox(height: 25,),
                            RichText(
                              text: TextSpan(
                                  text: 'Enter the 4-digit code sent to you at +91 ${widget.phone}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(text: ' Did you enter the correct number?',

                                        style: TextStyle(
                                            color: Color(0xff247B1C), fontSize: 14,fontWeight: FontWeight.bold),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (_) => registration()//homePage()
                                                ));
                                          }
                                    )
                                  ]
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:48.0),
                              child: TextFieldPin(
                                filled: true,
                                filledColor: Colors.grey.shade50,
                                codeLength:_otpCodeLength,
                                boxSize: 40,
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

                            GestureDetector(
                              onTap: (){
                                cnst.successToast("Again OTP send to ${widget.phone}",context);
                                startTimer();
                                _start = 60;
                                // _verifyPhone();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Resend Code in $_start seconds",style: TextStyle(
                                  color: _start==0? Colors.blue:Color(0xff247B1C), fontSize: 14,)),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top:25.0),
                        child: GestureDetector(
                            onTap: () async {
                              // one();
                              setState(() {
                                _isLoading =!_isLoading;
                              });
                              // checkk();


                              // var request = http.Request('GET', Uri.parse('http://3.140.249.61:8080/driver/login?driverContactNo=${widget.phone}'));
                              print( "Starrt");
                              // var response = await _APIservice.userLogin("953155640")
                              var request = http.Request('GET', Uri.parse('http://3.140.249.61:8080/driver/login?driverContactNo=${widget.phone}'));

                              http.StreamedResponse response = await request.send();
                              final respStr = await response.stream.bytesToString();
                              print( "work");
                              print( response.statusCode);



                              if (response.statusCode == 200) {
                                final Map parsed = json.decode(respStr);
                                final result = LoginResult.fromJson(parsed);
                                setState(() {
                                  _isLoading = false;
                                });
                                cnst.successToast("Succefully Login",context);
                                print( "response.stream.bytesToString()");
                                print( response.statusCode);
                                print( result.toJson().toString());
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                await prefs.setString('DUTY', "OFF DUTY");
                                await prefs.setBool('login', true);
                                await prefs.setString('userID',result.driverId.toString());
                                await prefs.setString('Name',result.driverName.toString());
                                await prefs.setString('email',result.driverEmail.toString());
                                await prefs.setString('mobileNumber',result.driverContactNo.toString());
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => homePage()),
                                        (route) => false);
                              }
                              else {
                                setState(() {
                                  _isLoading = false;
                                });
                                cnst.successToast("Login Not possible some server issue, contact INDCAB ",context);
                                setState(() {
                                  _isLoading = false;
                                });
                                print(response.reasonPhrase);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => homePage()),
                                        (route) => false);
                              }

                              // try {
                              //   await FirebaseAuth.instance
                              //       .signInWithCredential(PhoneAuthProvider.credential(
                              //       verificationId: _verificationCode, smsCode: _code))
                              //       .then((value) async {
                              //     if (value.user != null) {
                              //       cnst.successToast("Succefully Login",context);
                              //
                              //
                              //
                              //       var request = http.Request('GET', Uri.parse('http://3.140.249.61:8080/user/login?mobileNumber=${widget.phone}'));
                              //
                              //
                              //       http.StreamedResponse response = await request.send();
                              //       final respStr = await response.stream.bytesToString();
                              //
                              //
                              //
                              //
                              //       if (response.statusCode == 200) {
                              //         final Map parsed = json.decode(respStr);
                              //         final result = LoginResult.fromJson(parsed);
                              //         setState(() {
                              //           _isLoading = false;
                              //         });
                              //         cnst.successToast("Succefully Login",context);
                              //         print( "response.stream.bytesToString()");
                              //         print( response.statusCode);
                              //         SharedPreferences prefs = await SharedPreferences.getInstance();
                              //         await prefs.setBool('login', true);
                              //         await prefs.setString('userID',result.userId.toString());
                              //         await prefs.setString('firstName',result.firstName.toString());
                              //         await prefs.setString('lastName',result.lastName.toString());
                              //         await prefs.setString('email',result.email.toString());
                              //         await prefs.setString('mobileNumber',result.mobileNumber.toString());
                              //         await prefs.setString('emergencyMobileNumber',result.emergencyMobileNumber.toString());
                              //         Navigator.pushAndRemoveUntil(
                              //             context,
                              //             MaterialPageRoute(builder: (context) => homePage()),
                              //                 (route) => false);
                              //       }
                              //       else {
                              //         setState(() {
                              //           _isLoading = false;
                              //         });
                              //         cnst.successToast("Login Not possible some server issue",context);
                              //         setState(() {
                              //           _isLoading = false;
                              //         });
                              //         print(response.reasonPhrase);
                              //       }
                              //
                              //       // Navigator.pushAndRemoveUntil(
                              //       //     context,
                              //       //     MaterialPageRoute(builder: (context) => homePage()),
                              //       //         (route) => false);
                              //     }
                              //   });
                              // } catch (e) {
                              //   setState(() {
                              //     _isLoading = false;
                              //   });
                              //   print("eeeeeeeeeeeeeeee $_code $e");
                              //   FocusScope.of(context).unfocus();
                              //   cnst.successToast("Enter Valid OTP",context);
                              //
                              // }
                            },
                            child: CircleAvatar(child: Image.asset("assets/Go.png"),radius: 30,backgroundColor: Color(0xff247B1C),)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> checkk() async {
    print("ccccccccccccccc");


    var request = http.MultipartRequest('POST', Uri.parse('Replace this API'));
    request.fields.addAll({
      'phone': widget.phone,
      'otp': _code
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      one();
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('login', true);
      //
      // cnst.successToast("Login Successfully",context);
      //
      // print("llllllllllllllllllllll");
      // print(await response.stream.bytesToString());
    }
    else {
      setState(() {
        _isLoading = false;
      });
      cnst.successToast(response.reasonPhrase,context);
      print("ooooooooooooooooooooooo");
      print(response.reasonPhrase);
      setState(() {
        _isLoading =!_isLoading;
      });
    }
  }


 one() async {
   try{
     var request = http.Request('GET', Uri.parse(
         'http://3.140.249.61:8080/user/login?mobileNumber=${widget.phone}'));
     http.StreamedResponse response = await request.send();
     final respStr = await response.stream.bytesToString();

     if (response.statusCode == 200) {

       final Map parsed = json.decode(respStr);
       final result = LoginResult.fromJson(parsed);


       SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.setBool('login', true);
       await prefs.setString('userID', result.driverId.toString());
       await prefs.setString('firstName', result.driverName.toString());
       await prefs.setString('email', result.driverEmail.toString());
       await prefs.setString('mobileNumber', result.driverContactNo.toString());
       setState(() {
         _isLoading = false;
       });
       cnst.successToast("Login Successfully", context);


       Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) => homePage()),
               (route) => false
       );
     }
     else {

       setState(() {
         _isLoading = false;
       });
       cnst.successToast("Login Error", context);

       // print(response.reasonPhrase);
     }
   } catch (e) {
  print(e);
  }
 }
}

