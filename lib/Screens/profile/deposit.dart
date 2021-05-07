import 'package:flutter/material.dart';
import 'package:indcabdriver/Screens/account/onlinePayment.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/constants.dart';
import 'package:indcabdriver/widgets/custumColors.dart';


class deposit extends StatefulWidget {
  @override
  _depositState createState() => _depositState();
}

class _depositState extends State<deposit> {

  final cnst=constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: appbarName("Deposit Cash/Online"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:28.0,bottom: 38),
                child: Text("- ₹ 624",style: new TextStyle(color: MyColors.black,fontSize: 48,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 100),
                child: Text("Low Balance Your bookings may drop if dues are not clear immediately"
                    ,style: new TextStyle(color: Colors.black87,fontSize: 26,)),
              ),SizedBox(height: 20,),

              ListTile(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => payment()
                      ));
                },
                trailing: Icon(Icons.arrow_forward_ios,color: MyColors.themeClr),
                title:Text("Pay Online",style: new TextStyle(color: MyColors.themeClr,fontSize: 22,fontWeight: FontWeight.w400),),
              ),
              ListTile(

                  onTap: (){
                    cnst.successToast("Okay Please Contact INDCAB Near Office",context);

                    // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (_) => payment()
                  //     ));
                },
                trailing: Icon(Icons.arrow_forward_ios,color: MyColors.themeClr),
                title:Text("Pay through cash(Ind center)",style: new TextStyle(color: MyColors.themeClr,fontSize: 22,fontWeight: FontWeight.w400),),
              ),

              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
