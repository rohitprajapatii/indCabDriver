import 'package:flutter/material.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffE7E8EA),
      appBar: appbarName("Settings"),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("UPDATES", style: new TextStyle(fontSize: 28,color: Colors.black54,),),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    leading: Icon(Icons.download_outlined,size: 30,color: Colors.black,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title:Text("App Updates",style: new TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                    subtitle:Text("0.1 (Current Version)",style: new TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w400),),
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
