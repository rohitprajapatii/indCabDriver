import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indcabdriver/Screens/account/rewards.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import 'bankTransfer.dart';
import 'history.dart';


class account extends StatefulWidget {
  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<account> {

  bool isSwitched = false;
  bool _value = false;

  List<bool> _selected = List.generate(20, (i) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appbarName1("Accounts"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 190,
                width: double.infinity,
                child: Card(
                  elevation: 9,
                  color: MyColors.themeClr,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Today, 22nd Oct",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: Colors.white),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:12.0),
                          child: Text("₹ 0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                        ),
                        Text("0 Ride,",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.white),)
                      ],
                    ),
                  ),
                ),
              ),SizedBox(height:15),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => bankTrasfer()
                              )
                          );
                        },
                        trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 18,),
                        leading: SvgPicture.asset("assets/icons/flat.svg"),
                        title:Text("Bank Transfer",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                        subtitle:Text("No balance to be paid",style: new TextStyle(color: Colors.black,fontSize: 16),),
                      ),Divider(),
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => history()
                              )
                          );
                        },
                        trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 18,),
                        leading: SvgPicture.asset("assets/icons/Group.svg"),
                        title:Text("Earning History",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      ),Divider(),
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) =>  rewards()
                              )
                          );
                        },
                        trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 18,),
                        leading: SvgPicture.asset("assets/icons/gift.svg"),
                        title:Text("Rewards",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      ),Divider(),

                      // ListTile(
                      //   onTap: (){
                      //     Navigator.of(context).push(
                      //         MaterialPageRoute(builder: (_) => bankTrasfer()
                      //         )
                      //     );
                      //   },
                      //   trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 18,),
                      //   leading: SvgPicture.asset("assets/icons/announce.svg"),
                      //   title:Text("Bank Transfer",style: new TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      // ),
                    ],
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
