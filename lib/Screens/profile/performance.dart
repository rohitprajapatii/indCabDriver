import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';

class performance extends StatefulWidget {
  @override
  _performanceState createState() => _performanceState();
}

class _performanceState extends State<performance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Performance"),
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
                    Text("Car Quality Score", style: new TextStyle(fontSize: 23,color: Colors.black,),),
                    Text("Last 250 bookings", style: new TextStyle(fontSize: 15,color: Colors.black54,),),
                    // SvgPicture.asset("assets/profile/range.svg",height:115 ,width: 15,),SizedBox(width: 51,),
                    SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment:   CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,width: 130,
                          child: ClipPath(
                            clipper: MessageClipper(borderRadius: 1),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(1.0)),
                                color: Colors.orange,
                              ),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.only(bottom:12.0),
                                child: Text("10/7.5",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                              )),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:   CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment:   CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,height: 15,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40.0),
                                            bottomRight: Radius.circular(40.0)),
                                        // topLeft: Radius.circular(40.0),
                                        // bottomLeft: Radius.circular(40.0)
                                    ),

                                ),SizedBox(height: 6,),
                                Text("BAD", style: new TextStyle(fontSize: 15,color: Colors.black54,),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,height: 15,color: Colors.orange,
                                  ),SizedBox(height: 6,),
                                  Text("AVERAGE", style: new TextStyle(fontSize: 15,color: Colors.black54,),),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 100,height: 15,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40.0),
                                            bottomRight: Radius.circular(40.0)),
                                        // topLeft: Radius.circular(40.0),
                                        // bottomLeft: Radius.circular(40.0)
                                    ),

                                ),SizedBox(height: 6,),
                                Text("GOOD", style: new TextStyle(fontSize: 15,color: Colors.black54,),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:20.0,bottom: 40),
                        child: Text("how to improve car  quality", style: new TextStyle(fontSize: 14,color: MyColors.themeClr,),),
                      ),
                    ),
                  ],
                ),
              ),SizedBox(height: 8,),

              Divider(thickness: 2,),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Maintain car clean and use car perfume", style: new TextStyle(fontSize: 18,color: Colors.black54,),),
              ),
              Divider(thickness: 2,),
              Padding(
                padding:  const EdgeInsets.all(15.0),
                child: Text("Improve AC quality and always offer AC to customer", style: new TextStyle(fontSize: 18,color: Colors.black54,),),
              ),
              Container(
                color: Colors.grey.shade100,
                  width: double.infinity,
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("PERFORMANCE HISTORY", style: new TextStyle(fontSize: 15,color: Colors.black54,),),
              )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("YESTERDAY", style: new TextStyle(fontSize: 18,color: MyColors.themeClr,),),
                            Text("22nd Oct 2020", style: new TextStyle(fontSize: 15,color: Colors.black54,),),
                          ],
                        ),
                        Icon(Icons.arrow_drop_down_circle_outlined)
                      ],
                    ),SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Completed Bookings", style: new TextStyle(fontSize: 18,color: Colors.black54,),),
                        Text("0", style: new TextStyle(fontSize: 18,color: Colors.black54,),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("5* Bookings", style: new TextStyle(fontSize: 18,color: Colors.black54,),),
                        Text("Not Available", style: new TextStyle(fontSize: 18,color: Colors.black54,),),
                      ],
                    ),

                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
