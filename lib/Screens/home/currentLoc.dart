import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/constants.dart';
import 'package:indcabdriver/widgets/secrets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homePage.dart';

class currentLoc extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  List list = new List();

  final cnst=constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarName("Search GOTO Location"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        SizedBox(height: 15,),

            // ignore: deprecated_member_use

            GooglePlaceAutoCompleteTextField(
                textEditingController: controller,
                googleAPIKey: Secrets.API_KEY,
                inputDecoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0,),
                      borderSide: new BorderSide(color: Color(0xffFA4D09),width: 1),
                    ),
                    // focusedBorder: InputBorder.none,
                    enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
              borderSide: new BorderSide(color: Color(0xffFA4D09)),
            ),
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Search GOTO your location"),
                debounceTime: 800,
                countries: ["in", "fr"],
                isLatLngRequired: true,
                getPlaceDetailWithLatLng: (Prediction prediction) async {
                  list.clear();
                  print("placeDetails" + prediction.lat.toString()+ prediction.lng.toString());

                  String latlong= "${prediction.lat.toString()} + ${prediction.lng.toString()}";
                  await list.add(latlong);
                  String pass =prediction.description;
                  await list.add(pass);
                  print("kkkkk");
                  print(prediction);
                  String a =prediction.description.split(",").sublist(0, 1).toString();

                  String localA =a.replaceAll('[', '');
                  localA =localA.replaceAll(']', '');
                  String fullAdress =prediction.description.toString();
                  SharedPreferences prefs = await SharedPreferences.getInstance();

                  await prefs.setString('DUTY', "GO TO");
                  prefs.commit();
                  cnst.successToast("GOTO location saved",context);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) =>
                          homePage1()
                        // homePage1(localA:localA,fullAdress :fullAdress),
                        //payOnline()
                      )
                  );


                  // Navigator.pop(context,list);
                },
                itmClick: (Prediction prediction) async {
                  controller.text = prediction.description;
                  controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: prediction.description.length));

                }
              // default 600 ms ,
            ),
          ],
        ),
      ),
    );
  }
}
