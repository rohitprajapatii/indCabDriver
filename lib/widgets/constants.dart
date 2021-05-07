import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class constant{

  String Url ="http://3.140.249.61:8080";

  void showToast(String msg,context) {
    

    Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  void successToast(String msg,context) {
    Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
  }


  cmera(context) async {

    // await  Navigator.push(context, MaterialPageRoute(builder: (context) => Camera(
    //   initialCamera: CameraSide.front,
    //   enableCameraChange: false,
    //   mode: CameraMode.normal,
    //   imageMask: CameraFocus.circle(
    //     color: Colors.black.withOpacity(1),
    //   ),
    // )));
  }

   makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }






}