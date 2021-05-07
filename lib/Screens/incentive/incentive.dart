import 'package:flutter/material.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';

class incentive extends StatefulWidget {
  @override
  _incentiveState createState() => _incentiveState();
}

class _incentiveState extends State<incentive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appbarName1("Incentives"),
      body:  DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                  labelColor: MyColors.themeClr,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(fontSize: 16,
                      color: Colors.grey),
                  indicatorWeight: 2.0,
                  indicatorColor:  MyColors.themeClr,
                  tabs: [
                    Tab(text: "Todays Scheme".toUpperCase(),),
                    Tab(text: "Scheme History".toUpperCase()),
                  ]),
            ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color:Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/coin.png"),SizedBox(width: 6,),
                                    Text("INCENTIVE EARNED\nTill now",style: TextStyle(fontSize: 18),),SizedBox(height: 15,),
                                  ],
                                ),SizedBox(width: 8,),
                                Flexible(
                                    child: Text("Go to accounts screen for more details",textAlign: TextAlign.right,style: TextStyle(fontSize: 18),)),SizedBox(height: 15,),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("₹Scheme Details".toUpperCase(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
                        ),SizedBox(height: 15,),

                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Container(
                                    color: Color(0xFFFEFEE2),
                                    child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text("Keep completion above 80%  accept more rides & avoid DDD cancellation to be eligible for incentive. Check See All Rides in Help for DDD details",style: TextStyle(fontSize: 16)),
                                )),SizedBox(height: 15,),
                                Text("Ola has changed the payout plan. Kindly contact Operator for scheme details &#10;&#10;&#10;",style: TextStyle(fontSize: 16)),

                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),

                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child:ListView.separated(
                          // physics: NeverScrollableScrollPhysics(),
                          // shrinkWrap: true,
                          itemCount: 35,
                          itemBuilder: (BuildContext context,int index){
                            return Container(
                              color: Colors.white,
                              child:  ListTile(
                                onTap: () {

                                },
                                trailing:  Text("₹ 0.00",style: new TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),),
                                title: Text("2020-10-23", style: new TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),),
                              ),
                            );
                          }, separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 2,color: Colors.grey,width: double.infinity,
                        );
                      },
                      ),
                  ),


                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
