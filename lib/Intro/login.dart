import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:indcabdriver/Intro/reg.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/constants.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

import 'otp.dart';
import 'package:http/http.dart' as http;


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  bool _isLoading = false;
  final _number = TextEditingController();
  final cnst=constant();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSignatureCode();

  }

  String signature ="";
  _getSignatureCode() async {
    setState(() async {
      signature = await SmsRetrieved.getAppSignature();

    });

    print("signature $signature");
  }
  void _doSomething() async {

    try {
      var request = http.MultipartRequest('POST', Uri.parse('Replace this API'));
      request.fields.addAll({
        'phone': _number.text.toString(),
        'signature': signature,
      });


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) =>
                otp(_number.text) //homePage()
            ));

      }
      else {
        print(response.reasonPhrase);
      }
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      // throw e;
      print("ppppppppppppp $e");
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  appbarName("Sign-in"),
        body: LoadingOverlay(
          isLoading: _isLoading,
          // demo of some additional parameters
          opacity: 0.3,
          progressIndicator: CircularProgressIndicator(),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [

                    Column(
                      children: [
                        SizedBox(height: 30,),

                        Center(child: Text("What's your Mobile Number?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
                        SizedBox(height: 60,),

                        Row(
                          children: [
                            Container(
                                child: Image.asset("assets/india.png",height: 25,width: 33,)),
                            Padding(
                              padding: const EdgeInsets.only(bottom:8.0,left: 8,right: 8),
                              child: _text("+91"),
                            ),
                            Expanded(
                              child: TextField(
                                maxLength: 10,
                                controller: _number,
                                keyboardType: TextInputType.number,
                                decoration: _decoration("9876543210"),
                              ),
                            ),
                          ],
                        ), SizedBox(height: 15,),

                        Center(
                          child: RichText(
                            text: TextSpan(
                                text: 'Don\'t have an account?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(text: ' Register',
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
                        ),SizedBox(height: 90,),
                        ButtonTheme(
                          minWidth: double.infinity,
                          height: 40,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: MyColors.themeClr,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () async {
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(builder: (_) => otp(_number.text)//homePage()
                              //     ));

                              if(_number.text.toString().length == 10){
                                FocusScope.of(context).unfocus();

                                setState(() {
                                  _isLoading =true;
                                });
                                print("lllll ${_number.text.toString()} ");

                                try{
                                  var request = http.Request('GET', Uri.parse(
                                      'http://3.140.249.61:8080/driver/login?driverContactNo=${_number
                                          .text.toString()}'));
                                  print("lllll");

                                  http.StreamedResponse response = await request.send();
                                  print("lllll");
                                  if (response.statusCode == 200) {
                                    print("lllll");
                                    print(response.stream.bytesToString());

                                    _doSomething();

                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(builder: (_) =>
                                    //         otp(_number.text) //homePage()
                                    //     ));
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  } else {
                                    print(response.reasonPhrase);
                                    cnst.successToast(
                                        "This Mobile Number Is not registered, please visit INDCAB office",
                                        context);
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                }catch (e) {
                                  print("error: $e");
                                  setState(() {
                                    _isLoading = false;
                                    cnst.successToast("Insecure HTTP is not allowed",context);
                                  });
                                  }
                              }else{
                                cnst.successToast("Enter Valid Mobile Number",context);
                              }
                            },
                            child: Text(
                              "Continue".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16.0,fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),



                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  _text(String s) {
    return  Padding(
      padding: const EdgeInsets.only(top:14.0),
      child: Text(s
        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
    );
  }

  _decoration(String s) {
    return InputDecoration(
        counterText: "",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff247B1C)),
          //  when the TextFormField in focused
        ) ,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          //  when the TextFormField in unfocused
        ) ,
        // contentPadding:
        // EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: s);
  }

}
