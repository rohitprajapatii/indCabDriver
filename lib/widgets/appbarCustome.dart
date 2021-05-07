import 'package:flutter/material.dart';
import 'package:indcabdriver/widgets/custumColors.dart';

class appbarName extends StatelessWidget implements PreferredSizeWidget  {
  final String title;
  appbarName(this.title);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: MyColors.themeClr),
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: () => Navigator.pop(context),
        color: Colors.black,
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
class appbarName1 extends StatelessWidget implements PreferredSizeWidget  {
  final String title;
  appbarName1(this.title);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: MyColors.themeClr),
      ),
      backgroundColor: Colors.white,
      // leading: IconButton(
      //   icon: Icon(Icons.chevron_left),
      //   onPressed: () => Navigator.pop(context),
      //   color: Colors.black,
      // ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
