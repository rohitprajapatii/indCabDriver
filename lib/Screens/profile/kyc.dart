import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';


class kyc extends StatefulWidget {
  @override
  _kycState createState() => _kycState();
}

class _kycState extends State<kyc> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("KYC"),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(child: Text("KYC Verification program", style: new TextStyle(fontSize: 28,color: Colors.black,),)),
                        SvgPicture.asset("assets/profile/Group 9953.svg",height:115 ,width: 15,),SizedBox(width: 51,),
                      ],
                    ),

                  ],
                ),
              ),
              ListTile(
                leading: Image.asset("assets/coin.png"),
                trailing: Text("1",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                title:Text("ATTACHED REFFERALS",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              ),
              Divider(),
              ListTile(
                leading: Text(""),
                trailing: Text("₹ 60",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                title:Text("Transferred",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              ),
              Divider(),
              ListTile(
                leading: Text(""),
                trailing: Text("₹ 10",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                title:Text("To be Transferred",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              ),
             Padding(
               padding: EdgeInsets.only(top: 15,bottom: 10),
               child: Container(

                 color: Colors.grey.shade200,height: 30,
               ),
             ),
              ListTile(
                leading: SvgPicture.asset("assets/profile/Docs_3_.svg",),
                trailing: Text("15",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                title:Text("KYC SUMMARY",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              ),
              Divider(),
              ListTile(
                leading: Text(""),
                trailing: Text("5",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                title:Text("KFC VERIFIED",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              ),
              Divider(),
              ListTile(
                leading: Text(""),
                trailing: Text("10",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                title:Text("KFC REJECTED",style: new TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              ),





            ],
          ),
        ),
      ),
    );
  }
}
