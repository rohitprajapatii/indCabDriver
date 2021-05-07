import 'package:after_layout/after_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Intro/firstPage.dart';
import 'Intro/intro.dart';
import 'Intro/login.dart';
import 'Screens/home/home.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Color(0xff247B1C) and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    // if (_seen) {
    //   Navigator.of(context).pushReplacement(
    //       new MaterialPageRoute(builder: (context) => new// MapSample()
    //       // MapScreen()
    //       homePage()
    //       // firstPage()
    //       ));
    //
    // } else {
    //   await prefs.setBool('seen', true);
    //   Navigator.of(context).pushReplacement(
    //       new MaterialPageRoute(builder: (context) => new intro()));
    // }


      if (_seen) {
        bool _login = (prefs.getBool('login') ?? false);
        if(_login){
          print("jjjjjjj");

          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new homePage()
              ));
        }else{
          print("iiiiiiiiii");

          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new
              firstPage()
                // homePage()
              ));
        }


      } else {
        await prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new intro()));
      }

  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}