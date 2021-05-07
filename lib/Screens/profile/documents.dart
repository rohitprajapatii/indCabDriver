import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indcabdriver/Screens/account/image.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:toast/toast.dart';

class documents extends StatefulWidget {
  @override
  _documentsState createState() => _documentsState();
}

class _documentsState extends State<documents> {
  File _image;


  void _showPicker(context, String s) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {

                         _imgFromGallery(s);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera(s);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera(String s) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
      Toast.show("$s uploaded Successfully", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

    });
  }

  _imgFromGallery(String s) async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
      Toast.show(s, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Vehicle Documents"),
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
                      onTap:(){
                        _showPicker(context,"Driving Licence");

                        if(_image.path.isNotEmpty){

                        }

                      },
                      trailing:CircleAvatar(
                        backgroundColor: MyColors.themeClr,
                        radius: 15,child: Icon(Icons.camera_alt_outlined,size: 20,),
                      ),
                      title:Text("Driving Licence",style: new TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),),
                      subtitle:Text("A driving license is an official do...",style: new TextStyle(color: Colors.grey,fontSize: 15,),),
                    ),
                    ListTile(
                      onTap:(){
                        _showPicker(context,"Address Proof");
                      }, trailing:CircleAvatar(
                        backgroundColor: MyColors.themeClr,
                        radius: 15,child: Icon(Icons.camera_alt_outlined,size: 20,),
                      ),
                      title:Text("Address Proof",style: new TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),),
                      subtitle:Text("Upload your permanent address...",style: new TextStyle(color: Colors.grey,fontSize: 15,),),
                    ),
                    ListTile(
                      onTap:(){
                        _showPicker(context,"RC Book");
                      }, trailing:CircleAvatar(
                        backgroundColor: MyColors.themeClr,
                        radius: 15,child: Icon(Icons.camera_alt_outlined,size: 20,),
                      ),
                      title:Text("RC Book",style: new TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),),
                      subtitle:Text("Vehicle Registration",style: new TextStyle(color: Colors.grey,fontSize: 15,),),
                    ),
                    ListTile(
                      onTap:(){
                        _showPicker(context,"Insurance Policy");
                      },  trailing:CircleAvatar(
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
