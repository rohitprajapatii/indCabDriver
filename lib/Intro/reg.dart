import 'package:flutter/material.dart';
import 'package:indcabdriver/Screens/home/home.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';

import 'login.dart';

class registration extends StatefulWidget {
  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
    } else {
      form.save();
      // User.instance.save().then((result) {
      //   print("Saving done: ${result}.");
      //   Navigator.pop(context);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Register"),
      body: Container(
        height: MediaQuery.of(context).size.height,
    color: Colors.white,
        child:Center(child: Text("For Registration Please Contact INDCAB Near by Office,\n\nThank you,",
          textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),

        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       children: [
        //
        //      /*   new Form(
        //           key: _formKey,
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal:8.0),
        //             child: Column(
        //
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //
        //                 _text("Mobile number"),
        //                 Row(
        //                   children: [
        //                     Container(
        //                         child: Image.asset("assets/india.png",height: 25,width: 33,)),
        //                     Padding(
        //                       padding: const EdgeInsets.only(bottom:8.0,left: 8,right: 8),
        //                       child: _text("+91"),
        //                     ),
        //                     Expanded(
        //                       child: TextField(
        //                         // keyboardType: Inpu,
        //                         decoration: _decoration("ex:987847587"),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 _text("Email"),
        //                 TextField(
        //                   // keyboardType: Inpu,
        //                   decoration: _decoration("email@gmail.com"),
        //                 ),
        //                 _text("Name"),
        //                 Row(
        //                   children: [
        //                     Expanded(
        //                       child: TextField(
        //                         // keyboardType: Inpu,
        //                         decoration: _decoration("First Name"),
        //                       ),
        //                     ),SizedBox(width: 10,),
        //                     Expanded(
        //                       child: TextField(
        //                         // keyboardType: Inpu,
        //                         decoration: _decoration("Last Name"),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 _text("Emergency Number1"),
        //                 TextField(
        //                   // keyboardType: Inpu,
        //                   decoration: _decoration("097987897"),
        //                 ),
        //                 // _text("Emergency Number2"),
        //                 // TextField(
        //                 //   // keyboardType: Inpu,
        //                 //   decoration: _decoration("097987897"),
        //                 // ),
        //                 // _text("Password"),
        //                 // TextField(
        //                 //   obscureText: true,
        //                 //   // keyboardType: Inpu,
        //                 //   decoration: _decoration("***********"),
        //                 // ),
        //                 // _text("Confirm Password"),
        //                 // TextField(
        //
        //                 //   obscureText: true,
        //                 //   // keyboardType: Inpu,
        //                 //   decoration: _decoration("***********"),
        //                 // ),
        //                 SizedBox(height: 30,),
        //                 ButtonTheme(
        //                   minWidth: double.infinity,
        //                   height: 40,
        //                   child: FlatButton(
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(20.0),
        //                     ),
        //                     color: MyColors.themeClr,
        //                     textColor: Colors.white,
        //                     padding: EdgeInsets.all(8.0),
        //                     onPressed: () {
        //                       Navigator.of(context).push(
        //                           MaterialPageRoute(builder: (_) => homePage()
        //                           ));
        //                     },
        //                     child: Text(
        //                       "Continue".toUpperCase(),
        //                       style: TextStyle(
        //                           fontSize: 16.0,fontWeight: FontWeight.bold
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 SizedBox(height: 30,),
        //
        //
        //                 Center(
        //                   child: Text(
        //                     "By continuing, I confirm that i have read & agree to the\nTerms & conditions and Privacy policy",
        //                     style: TextStyle(
        //                         fontSize: 12.0,fontWeight: FontWeight.normal
        //                     ),textAlign: TextAlign.center,
        //                   ),
        //                 ),SizedBox(height: 15,),
        //
        //
        //               ],
        //             ),
        //           ),
        //         ),*/
        //       ],
        //     ),
        //   ),
        // ),
      ),
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
