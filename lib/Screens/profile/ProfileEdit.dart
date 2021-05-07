import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/constants.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;


class profileEdit extends StatefulWidget {
  var data;
  profileEdit({Key key, @required this.data}): super(key: key);


  @override
  _profileEditState createState() => _profileEditState();
}

class _profileEditState extends State<profileEdit> {
  File _image;
  String _img,url;
  String Name ="";
  final _name = TextEditingController();
  final cnst=constant();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    url ="/editprofile";
    load();
  }



  bool _isLoggedIn = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Edit Profile"),
      body: LoadingOverlay(
        isLoading: _isLoggedIn,
        opacity: 0.2,
        color: Colors.cyan.shade100,
        progressIndicator: CircularProgressIndicator(),
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                // _text("Profile Picture"),

                GestureDetector(
                  onTap: (){
                    _showPicker(context,"Profile Picture");
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.cyan,
                      child: ClipOval(
                        child: new SizedBox(
                          width: 190.0,
                          height: 190.0,
                          child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):FadeInImage.assetNetwork(
                            placeholder: 'assets/images/male.png',
                            image: "$_img",
                            fit: BoxFit.cover,
                            height: 250.0,
                          )
                          // Image.network(_img,
                          //   // "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),


                _text("Name"),
                TextField(
                  controller: _name,
                  keyboardType:TextInputType.text,
                  decoration: _decoration("Name"),
                ),
                // _text("About"),
                // TextField(
                //   // keyboardType: Inpu,
                //   // minLines: 3,
                //   minLines: 3,
                //   maxLines: 6,
                //   decoration: _decoration("Write a something about you.."),
                // ),
                SizedBox(height: 20,),

                ButtonTheme(
                  minWidth: double.infinity,
                  height: 45,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: MyColors.themeClr,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      // if(_image == null) {
                      //  File filename = File(widget.data['avatar']);
                      //   uploadImage(filename,url,true);
                      //
                      // }else {
                      //   uploadImage(_image.path, url,false);
                      // }
                      Toast.show("Server busy try other time", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);



                      // Navigator.pop(context);
                    },
                    child: Text(
                      "Save".toUpperCase(),
                      style: TextStyle(
                          fontSize: 16.0,fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }


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

  Future<String> uploadImage(filename, url, bool bool) async {
    // if(_image.path.isEmpty) {
    //   filename = File(widget.data['avatar']);
    // }

    print("lllplpllplplp $filename");


    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _token1 = (prefs.getString('token') ?? '');
    String _token = "Bearer " + _token1;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':_token

    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'name': _name.text,
    });
    if(!bool){
      request.files.add(await http.MultipartFile.fromPath('image', filename));
    }
    request.headers.addAll(headers);
    request.followRedirects = false;
    // if(filename != null){
    //
    // }else{
    //
    // }
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setState(() {
        _isLoggedIn =true;
        load();
        Navigator.pop(context,true);
      });
      Toast.show("Uploaded Successfully", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

    }
    else {
      print(response.reasonPhrase);
    }
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


  _text(String s) {
    return  Padding(
      padding: const EdgeInsets.only(top:14.0),
      child: Text(s
        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
    );
  }

  _decoration(String s) {
    return new InputDecoration(
      // counterText: '',
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: new TextStyle(color: Colors.grey[800]),
        hintText: s,
        fillColor: Colors.white70);
  }

  void load() {
    setState(() {
      _isLoggedIn =false;
      _name.text = widget.data.toString()?? '';
    });
  }
}

