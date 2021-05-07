import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';


class carType extends StatefulWidget {
  @override
  _carTypeState createState() => _carTypeState();
}

class _carTypeState extends State<carType> {

  List<String> _icons = ["auto.svg","car.svg","sedan-car-model.svg","car-suv.svg","car-suv.svg","bus.svg","Group 9854.svg","Glyph.svg","truck.svg",];
  List<String> _Title = ["Ind-Auto","Ind-Mini","Ind-Sedan","Ind-Sedan Plus","Ind-Sedan SUV","Ind-TT 12+1","Ind-Bus","Ind-Tata Ace","Ind-407",];

  bool isSwitched = false;
  bool _value = false;

  List<bool> _selected = List.generate(20, (i) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appbarName("Vehicle-Type"),
      body: ListView.builder(
        itemCount: _Title.length,
        itemBuilder: (context, index) {


          return Padding(
            padding: const EdgeInsets.symmetric(vertical:6.0),
            child: ListTileSwitch(
              value: _selected[index],
              leading:  SvgPicture.asset(
                "assets/vehicle/${_icons[index]}",color: _selected[index] ? MyColors.themeClr : Colors.black54,
              ),
              onChanged: (value) {
                setState(() {
                  for(int i = 0; i < _selected.length; i++) {
                    _selected[i] = false;
                  }
                  // selectedIndex = index;
                  _selected[index] =!_selected[index];
                  _value = value;
                });
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.cupertino,
              switchActiveColor:MyColors.themeClr,
              title: Text(_Title[index],style: TextStyle(color: _selected[index] ? MyColors.themeClr : Colors.black45,),),
            ),
          );
        },
      )

    );
  }
}
