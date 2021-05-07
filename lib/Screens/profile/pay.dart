import 'package:flutter/material.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';


class payOnline extends StatefulWidget {
  @override
  _payOnlineState createState() => _payOnlineState();
}

class _payOnlineState extends State<payOnline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Pay Online"),
      body: Container(
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      trailing:CircleAvatar(
                        backgroundColor: MyColors.themeClr,
                        radius: 15,child: Icon(Icons.camera_alt_outlined,size: 20,),
                      ),
                      title:Text("Driving Licence",style: new TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),),
                      subtitle:Text("A driving license is an official do...",style: new TextStyle(color: Colors.grey,fontSize: 15,),),
                    ),
                    ListTile(
                      trailing:CircleAvatar(
                        backgroundColor: MyColors.themeClr,
                        radius: 15,child: Icon(Icons.camera_alt_outlined,size: 20,),
                      ),
                      title:Text("Address Proof",style: new TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),),
                      subtitle:Text("Upload your permanent address...",style: new TextStyle(color: Colors.grey,fontSize: 15,),),
                    ),
                    ListTile(
                      trailing:CircleAvatar(
                        backgroundColor: MyColors.themeClr,
                        radius: 15,child: Icon(Icons.camera_alt_outlined,size: 20,),
                      ),
                      title:Text("RC Book",style: new TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),),
                      subtitle:Text("Vehicle Registration",style: new TextStyle(color: Colors.grey,fontSize: 15,),),
                    ),
                    ListTile(
                      trailing:CircleAvatar(
                        backgroundColor: MyColors.themeClr,
                        radius: 15,child: Icon(Icons.camera_alt_outlined,size: 20,),
                      ),
                      title:Text("Insurance Policy",style: new TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),),
                      subtitle:Text("A driving license is an official do...",style: new TextStyle(color: Colors.grey,fontSize: 15,),),
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
              ),
              SizedBox(height: 120,),
              Padding(
                padding: const EdgeInsets.all(18.0),
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
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (_) => otp()//homePage()
                      //     ));
                    },
                    child: Text(
                      "SAVE".toUpperCase(),
                      style: TextStyle(
                          fontSize: 16.0,fontWeight: FontWeight.bold
                      ),
                    ),
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
