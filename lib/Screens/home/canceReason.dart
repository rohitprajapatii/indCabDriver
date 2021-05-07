
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:indcabdriver/Screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';



class cancelReson extends StatefulWidget {
  @override
  _cancelResonState createState() => _cancelResonState();
}

class _cancelResonState extends State<cancelReson> {

  List<String> _checked = ["A", "B"];
  String _picked = "Two";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Cancel Reasons"),
      ),
      body: _body(),
    );
    //
  }

  Widget _body(){
    return Stack(
      children: <Widget>[
        RadioButtonGroup(
          padding:  const EdgeInsets.all(8.0),
//            orientation: GroupedButtonsOrientation.VERTICAL,
          activeColor: Color(0xFFF4E600),
//            labelStyle: TextStyle(fontSize: ),
          labels: [
            "Customer isn't here",
            "Wrong address shown",
            "Don't charge rider",
            "Don't charge rider1",
            "Don't charge rider2",
            "Don't charge rider3",
            "Don't charge rider4",
          ],
          disabled: [
//              "Option 1"
            "Don't charge rider1",
            "Don't charge rider2",
            "Don't charge rider3",
            "Don't charge rider4",
          ],
          onChange: (String label, int index) => print("label: $label index: $index"),
          onSelected: (String label) => print(label),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 16),
            child: Container(
                child: ButtonTheme(
                  height: 40,
                  minWidth:  MediaQuery.of(context).size.width- 48,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: RaisedButton(
                    color:  Color(0xFF2A2E43) ,
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('_getRide', true);
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => new homePage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text("DONE ",style: TextStyle(color: Color(0xFFF4E600),fontWeight: FontWeight.bold),),
                    ),
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }

}