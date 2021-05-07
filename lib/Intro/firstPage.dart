import 'package:flutter/material.dart';
import 'package:indcabdriver/Intro/reg.dart';
import 'package:indcabdriver/widgets/custumColors.dart';

import 'login.dart';



class firstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset("assets/first.png"),SizedBox(height: 75,),
          Text("Welcome to the new\nDriver App.",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: MyColors.themeClr,fontWeight: FontWeight.bold),),
          SizedBox(height: 75,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => login()//homePage()
                      ));
                },
                child: Container(
                  width: 150,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 12),
                        child: Text("Sign-in",
                            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: MyColors.themeClr)),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => registration()//homePage()
                      ));
                },
                child: Container(
                  width: 150,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: MyColors.themeClr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 12),
                        child: Text("Register",
                            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: MyColors.white)),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

      ],
      )),
    );
  }
}
