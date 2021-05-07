import 'package:flutter/material.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {

  List<String> _Title = ["Complete your profile details","Update your KYC","Ind-Sedan","Update your vehicle details","Upload your profile picture",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Notifications"),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          itemCount: _Title.length,
          itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.symmetric(vertical:0.0),
              child: ListTile(
                title: Text(_Title[index],style: TextStyle(color: Colors.black45,),),
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return Divider();
        },
        ),
      ),
    );
  }
}
