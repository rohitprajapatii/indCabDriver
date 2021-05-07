// import 'package:flutter/material.dart';
// import 'package:indcab/Intro/login.dart';
// import 'package:indcab/Screens/Home/aboutUs.dart';
// import 'package:indcab/Screens/Home/coupons.dart';
// import 'package:indcab/Screens/Home/help.dart';
// import 'package:indcab/Screens/Home/myTrip.dart';
// import 'package:indcab/Screens/Home/onlinePayment.dart';
// import 'package:indcab/Screens/Home/settings.dart';
// import 'package:indcab/Screens/Home/wallet.dart';
//
// class drawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Padding(
//         padding: const EdgeInsets.only(left:8.0),
//         child: new ListView(
//           children: <Widget>[
//             // new UserAccountsDrawerHeader(
//             //   accountName: new Text("Pratap Kumar"),
//             //   accountEmail: new Text("kprathap23@gmail.com"),
//             //   decoration: new BoxDecoration(
//             //     image: new DecorationImage(
//             //       image: new ExactAssetImage("assets/images/lake.jpeg'),
//             //       fit: BoxFit.cover,
//             //     ),
//             //   ),
//             //   currentAccountPicture: CircleAvatar(
//             //       backgroundImage: NetworkImage(
//             //           "https://randomuser.me/api/portraits/men/46.jpg")),
//             // ),
//             Container(height: 220,color: Colors.white,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5)],
//                     ),
//
//                     child: CircleAvatar(
//                       backgroundColor: Colors.grey,
//                       radius:50,
//                       child: Icon(Icons.person,size: 60,color: Colors.white,),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Mahesh Gv"),
//                   ),
//                 ],
//               ),
//             ),),
//             new ListTile(
//                 //leading: Icon(Icons.library_music),
//                 title: new Text("Online Payment"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => test()
//                       ));}),
//             new ListTile(
//                 //leading: Icon(Icons.library_music),
//                 title: new Text("Online Payment"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => onlinePayment()
//                       ));}),
//             new ListTile(
//                 //leading: Icon(Icons.movie),
//                 title: new Text("My Trips"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => myTrip()
//                       ));
//
//                 }),
//             new ListTile(
//                 //leading: Icon(Icons.shopping_cart),
//                 title: new Text("Coupon"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => coupons()
//                       ));
//                 }),
//             new ListTile(
//                 //leading: Icon(Icons.apps),
//                 title: new Text("Wallet"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => wallet()
//                       ));
//                 }),
//             new ListTile(
//                 //leading: Icon(Icons.dashboard),
//                 title: new Text("Settings"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => settings()
//                       ));
//                 }),
//             new ListTile(
//                 //leading: Icon(Icons.settings),
//                 title: new Text("Help"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => help()
//                       ));}),
//             new Divider(),
//             new ListTile(
//                 //leading: Icon(Icons.info),
//                 title: new Text("About Us"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => aboutUs()
//                       ));}),
//             new ListTile(
//                 //leading: Icon(Icons.power_settings_new),
//                 title: new Text("Logout"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => login()
//                       ));
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
