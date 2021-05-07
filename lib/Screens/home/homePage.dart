
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
// import 'package:camera_camera/camera_camera.dart';
import 'package:circular_countdown/circular_countdown.dart';
// import 'package:commons/commons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:indcabdriver/Screens/home/text.dart';
import 'package:indcabdriver/test/app.dart';
import 'package:indcabdriver/testingP.dart';
import 'package:indcabdriver/widgets/custumColors.dart';
import 'package:indcabdriver/widgets/secrets.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'package:http/http.dart' as http;

import 'canceReason.dart';
import 'Bill.dart';
import 'cartype.dart';
import 'notification.dart';
import 'currentLoc.dart';
import 'package:indcabdriver/widgets/constants.dart';

class homePage1 extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage1> {
  TextEditingController _address = TextEditingController();
  TextEditingController _doorNo = TextEditingController();
  TextEditingController _landmark = TextEditingController();
  String lat, long, pass;
  List list = new List();

  GoogleMapController mapController;

  double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
  double _destLatitude = 13.0234533, _destLongitude = 77.7142729;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = Secrets.API_KEY;

  bool one = true;
  bool two = false;
  bool three = false;
  String DUTY ;

  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();


    print("dispose");
    super.dispose();
  }

  local() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      DUTY = (prefs.getString('DUTY') ?? '');
    });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        print("lllllllllllllllllllllllllllll");

        checkride = (prefs.getBool('_getRide') ?? false);
        print(DUTY);
        print(checkride);


      });

      });

  }


  Timer _timer;
  int _start = 60;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  // final assetsAudioPlayer = AssetsAudioPlayer();
  final cnst=constant();

  // String dropdownValue = 'Cash';
  //
  // List <String> spinnerItems = [
  //   'Payment method',
  //   'Cash',
  //   'Online',
  //   'Wallet',
  // ] ;


  bool checkride;

  @override
  void initState() {
    super.initState();
    url ="${cnst.Url}/driver/selfie/add";
    _getCurrentLocation();
    local();
    initialize();

    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => _getCurrentLocation());

    setState(() {
      one = false;
      two = true;
      three = true;
    });

    /// origin marker
  }

  var userData ;

  _getRide() async {
    try{
      print("ooooooooooooooooooooooooooooooooooooo");
      var request = http.Request(
          'GET', Uri.parse('http://3.140.249.61:8080/booking/request/get'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('_getRide', false);
        var respStr = await response.stream.bytesToString();
        print("mmmmmmmmmmmmmmmm");
        final  parsed = json.decode(respStr);
        setState(() {
          checkride =false;
          _acceptride=false;
          userData =parsed;
        });

        print("ooooooooooooooooooooooooooooooooooooo");
        print(respStr.toString());
        print(parsed[0]['bookingId']);
    }
    else {
    print(response.reasonPhrase);
    }
    } on FormatException catch (_) {
    throw FormatException("Unable to process the data");
    } catch (e) {
    // throw e;
    print("ppppppppppppp $e");
    }
  }


  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  Position _currentPosition;
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _originLatitude = position.latitude;
        _originLongitude = position.longitude;
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14.0,
            ),
          ),
        );
        setState(() {
          _currentPosition =
              LatLng(position.latitude, position.longitude) as Position;
        });
      });
    }).catchError((e) {
      print("EEE: $e");
    });
    if(checkride){
      _getRide();
    }
  }

  int _duration = 60;

  bool _acceptride =true;
  bool _otp =true;
  bool _liveRoute =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 58.0, right: 8),
          child: Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              child: Icon(
                Icons.location_searching_outlined,
                size: 20,
              ),
              backgroundColor: Colors.green,
              onPressed: () async {
                if (await Permission.location.request().isGranted) {
                  _getCurrentLocation();
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (_) => test()
                  //     ));

                  // Either the permission was already granted before or the user just granted it.
                }
              },
            ),
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(_originLatitude, _originLongitude), zoom: 14),
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              mapType: MapType.normal,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: _onMapCreated,
              markers: Set<Marker>.of(markers.values),
              polylines: Set<Polyline>.of(polylines.values),
            ),

            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).padding.top,
                  width: double.infinity,
                  color: Colors.grey.shade100,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Bookings Count",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54)),
                            Text("Operator Bill",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("0",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              Text("₹ 0.00",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            ],
                          ),
                        ),
                        Text("Last Updated .Mon,02 Nov 20, 10:32 Am",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 77,
                width: double.maxFinite,
                color: MyColors.themeClr, //grey.shade100,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {


                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) =>
                                // HomeScreen1()
                                carType()
                                // MyApp()
                                // testing()
                                )
                            );


                            // File file = await  Navigator.push(context, MaterialPageRoute(builder: (context) => Camera(
                            //   initialCamera: CameraSide.front,
                            //   enableCameraChange: false,
                            //   mode: CameraMode.normal,
                            //   imageMask: CameraFocus.circle(
                            //     color: Colors.black.withOpacity(1),
                            //   ),
                            // )));
                            // print("imae $file");

                            // // displayModalBottomSheet(context);
                            // ridestart();
                            // // _OTPBottomSheet();

                          },
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset("assets/vehicle/car.svg",
                                color: MyColors.themeClr),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 80,
                                          child: Text(
                                            "OFF DUTY",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                      Container(
                                          width: 90,
                                          child: Text(
                                            "ON DUTY",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                      Container(
                                          child: Text(
                                        "GO TO",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 200,
                                  height: 5,
                                  color: Colors.grey,
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        offDuyAlert(context);
                                        // setState(() {
                                        //   one = false;
                                        //   two = true;
                                        //   three = true;
                                        // });
                                      },
                                      child: Container(
                                          width: 66,
                                          child: DUTY == "OFF DUTY"//one
                                              ? Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/active.svg",
                                                    ),
                                                  ],
                                                ):
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Colors.grey,
                                              ),
                                            ],
                                          )
                                      )

                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showAlertDialog1(context);
                                        // setState(() {
                                        //   one =true;
                                        //   two =false;
                                        //   three =true;
                                        // });
                                      },
                                      child: Container(
                                          width: 70,
                                          child: DUTY == "ON DUTY"//two
                                              ? SvgPicture.asset(
                                            "assets/icons/inactive.svg",
                                          ):
                                          CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Colors.grey,
                                                )
                                              ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          GoToAlertDialog(context);

                                          // gotoDialog(context);
                                          // one =true;
                                          // two =true;
                                          // three =false;
                                        });
                                      },
                                      child: Container(
                                          alignment: Alignment.centerRight,
                                          width: 66,
                                          child: DUTY == "GO TO"//three
                                              ? SvgPicture.asset(
                                                  "assets/icons/inactive.svg",
                                                ):
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.grey,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Badge(
                            badgeContent: Text('3'),
                            child: IconButton(
                              icon: Icon(
                                Icons.notifications,
                                size: 40,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => notification()));
                              },
                            )
                            // Icon(Icons.notifications,size: 40,color: Colors.white,),
                            )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _acceptride ? Text("") :
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 40,backgroundColor: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SOS",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        // Text("₹155",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,width: 100,
                    child: TimeCircularCountdown(
                      countdownCurrentColor: Color(0xFFFE5F55),
                      countdownRemainingColor: Color(0xFF4F6367),
                      countdownTotalColor: Colors.transparent,
                      unit: CountdownUnit.second,
                      countdownTotal: 30,
                      onUpdated: (unit, remainingTime) => print('Updated'),
                      onFinished: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('_getRide', true);
                        setState(() async {
                          _acceptride =!_acceptride;


                          cnst.successToast("You missed the Ride",context);
                          await Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              checkride =true;
                            });
                          });
                        });

                        print('Countdown finished');
                      }
                    ),
                  ),
                ],
              ),
            ),

            _acceptride ? Text("") :
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                  width: double.infinity,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25,
                          child: Text(userData[0]['user']['firstName'][0],style: TextStyle(
                            fontSize: 35.0,
                            color: Color(0xFFffffff),
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        title: Text(userData[0]['user']['firstName'],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        subtitle: Text("3kms away | 2mins"),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right:15.0),
                          child: GestureDetector(
                            onTap: (){
                              cnst.makePhoneCall("tel://${userData[0]['user']['mobileNumber']}");
                            },
                            child: CircleAvatar(radius: 20,backgroundColor: Colors.green,
                              child: Icon(Icons.call,color: Colors.black,),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.0, top: 16.0),
                        child: Text(
                          'Customer PickUp Location',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF1181A1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.0, top: 16.0),
                        child: Text(userData[0]['pickUpLocation'],textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.0, top: 15.0, right: 24.0, bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RaisedButton(
                                  color: Colors.green,
                                  child: Text('ACCEPT',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  onPressed: () async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.setBool('_getRide', false);
                                    checkride =true;

                                    setState(() {
                                    checkride = false;
                                      cnst.successToast("You missed the Ride",context);
                                      _acceptride =!_acceptride;
                                      _otp=!_otp;
                                      // _OTPBottomSheet();
                                    });
                                    await Future.delayed(const Duration(seconds: 5), () {
                                      // setState(() {
                                      //   Navigator.pop(context);
                                      //
                                      //   _acceptride =true;
                                      //   _OTPBottomSheet();
                                      // });
                                    });

                                    print('button clicked');
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  color: Colors.red,
                                  child: Text('REJECT',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  onPressed: () async {

                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.setBool('_getRide',  true);
                                    prefs.commit();
                                    checkride =true;

                                    setState(() {
                                      checkride =true;
                                      _acceptride =!_acceptride;
                                    });
                                    print('button clicked');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext ctx) =>
                                                cancelReson()));
                                  },
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),


            _otp ? Text("") :
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                  width: double.infinity,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      TextFieldPin(
                        filled: true,
                        filledColor: Colors.grey.shade50,
                        codeLength: 4,
                        boxSize: 40,
                        filledAfterTextChange: false,
                        textStyle: TextStyle(fontSize: 16),
                        borderStyle: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                                Radius.circular(5))),
                        onOtpCallback: (code, isAutofill) =>
                            _onOtpCallBack(code, isAutofill),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.0, top: 16.0),
                        child: Text(
                          'Customer OTP',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF1181A1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.0, top: 16.0),
                        child: Text(
                          '11 Carr Road, Three Kings, Auckland 1042',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.0, top: 15.0, right: 24.0, bottom: 16.0),
                          child: RoundedLoadingButton(
                              child: Text('Check OTP', style: TextStyle(color: Colors.white)),
                              controller: _btnController,
                              onPressed: () async {

                                _btnController.start();
                                await Future.delayed(const Duration(seconds: 5), () {
                                  setState(() {
                                    _otp=!_otp;
                                    _liveRoute=!_liveRoute;

                                    // Navigator.pop(context);
                                    // _btnController.success();
                                    // _acceptride =true;
                                    // _goLivetomSheet();
                                  });
                                });

                              }
                          ),

                      ),
                    ],
                  )),
            ),

            _liveRoute? Text("") :
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                  width: double.infinity,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          final _originNOw = WayPoint(
                              name:  "start",
                              latitude: _originLatitude,
                              longitude: _originLongitude);
                          final _destinatn = WayPoint(
                              name: "destination",
                              latitude: _destLatitude,
                              longitude: _destLongitude);
                          //
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (_) => testP()
                          //     ));

                          var wayPoints = List<WayPoint>();
                          wayPoints.add(_originNOw);
                          wayPoints.add(_destinatn);

                          await _directions.startNavigation(
                              wayPoints: wayPoints,
                              options: MapBoxOptions(
                                  mode:
                                  MapBoxNavigationMode.drivingWithTraffic,
                                  simulateRoute: true,
                                  language: "en",
                                  units: VoiceUnits.metric));


                        },
                        child: Container(
                          color: Colors.grey,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Center(
                                child: Text('GoLive mapRoute',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset("assets/ride.gif",fit:BoxFit.fill,)),
                            ],
                          ),
                        ),
                      ),SizedBox(height: 8,),
                      Text('Ride is Completed ..!',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),

                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.0, top: 15.0, right: 24.0, bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RaisedButton(
                                  color: Colors.green,
                                  child: Text('Completed',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  onPressed: () async {
                                    _completerd();
                                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                                    // await prefs.setBool('_getRide',  true);
                                    // prefs.commit();
                                    // setState(()  {
                                    //   _liveRoute =!_liveRoute;
                                    //   checkride =true;
                                    //
                                    //
                                    // });




                                  },
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  color: Colors.green,
                                  child: Text('Check Bill',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  onPressed: () {
                                    _checkBill();
                                    // setState(() {
                                    //   _acceptride =!_acceptride;
                                    //
                                    // });
                                    // print('button clicked');
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext ctx) => billCheck()
                                    //     ));
                                  },
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            )


          ],
        ));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // void _showMyBottomSheet() {
  //   // the context of the bottomSheet will be this widget
  //   //the context here is where you want to showthe bottom sheet
  //   showBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return //MyBottomSheetLayout();
  //             Container(
  //                 width: double.infinity,
  //                 child: new Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     ListTile(
  //                       leading: CircleAvatar(
  //                         backgroundColor: Colors.red,
  //                         radius: 25,
  //                         child: Text("M"),
  //                       ),
  //                       title: Text("Mahesh Gv",
  //                           style: TextStyle(
  //                             fontSize: 18.0,
  //                             color: Colors.black,
  //                             fontWeight: FontWeight.bold,
  //                           )),
  //                       subtitle: Text("3kms away | 2mins"),
  //                       trailing: Padding(
  //                         padding: const EdgeInsets.only(right:15.0),
  //                         child: GestureDetector(
  //                           onTap: (){
  //                             // launch("tel://9538155640");
  //                           },
  //                           child: CircleAvatar(radius: 20,backgroundColor: Colors.green,
  //                           child: Icon(Icons.call,color: Colors.black,),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.only(left: 24.0, top: 16.0),
  //                       child: Text(
  //                         'Customer Location',
  //                         style: TextStyle(
  //                           fontSize: 20.0,
  //                           color: Color(0xFF1181A1),
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.only(left: 24.0, top: 16.0),
  //                       child: Text(
  //                         '11 Carr Road, Three Kings, Auckland 1042',
  //                         textAlign: TextAlign.left,
  //                         style: TextStyle(fontSize: 16.0, color: Colors.black),
  //                       ),
  //                     ),
  //                     Padding(
  //                         padding: EdgeInsets.only(
  //                             left: 24.0, top: 15.0, right: 24.0, bottom: 16.0),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Expanded(
  //                               child: RaisedButton(
  //                                 color: Colors.green,
  //                                 child: Text('ACCEPT',
  //                                     style: TextStyle(
  //                                         fontSize: 16.0,
  //                                         fontWeight: FontWeight.bold,
  //                                         color: Colors.white)),
  //                                 onPressed: () async {
  //                                   setState(() {
  //                                     Navigator.pop(context);
  //
  //                                     _acceptride =true;
  //                                     _OTPBottomSheet();
  //                                   });
  //                                   await Future.delayed(const Duration(seconds: 5), () {
  //                                     // setState(() {
  //                                     //   Navigator.pop(context);
  //                                     //
  //                                     //   _acceptride =true;
  //                                     //   _OTPBottomSheet();
  //                                     // });
  //                                   });
  //
  //                                   print('button clicked');
  //                                 },
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: 30,
  //                             ),
  //                             Expanded(
  //                               child: RaisedButton(
  //                                 color: Colors.red,
  //                                 child: Text('REJECT',
  //                                     style: TextStyle(
  //                                         fontSize: 16.0,
  //                                         fontWeight: FontWeight.bold,
  //                                         color: Colors.white)),
  //                                 onPressed: () {
  //                                   print('button clicked');
  //                                   Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute(
  //                                           builder: (BuildContext ctx) =>
  //                                               cancelReson()));
  //                                 },
  //                               ),
  //                             ),
  //                           ],
  //                         )),
  //                   ],
  //                 )); // returns your BottomSheet widget
  //       });
  // }


  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

  bool _isLoading = false;
  bool _liveBtn = true;
  void _OTPBottomSheet() {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return //MyBottomSheetLayout();
            Container(
               width: double.infinity,
               child: new Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   SizedBox(height: 10,),
                   TextFieldPin(
                     filled: true,
                     filledColor: Colors.grey.shade50,
                     codeLength: 4,
                     boxSize: 40,
                     filledAfterTextChange: false,
                     textStyle: TextStyle(fontSize: 16),
                     borderStyle: OutlineInputBorder(
                       // borderSide: BorderSide.none,
                         borderRadius: BorderRadius.all(
                             Radius.circular(5))),
                     // onOtpCallback: (code, isAutofill) =>
                     //     _onOtpCallBack(code, isAutofill),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 24.0, top: 16.0),
                     child: Text(
                       'Customer OTP',
                       style: TextStyle(
                         fontSize: 20.0,
                         color: Color(0xFF1181A1),
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 24.0, top: 16.0),
                     child: Text(
                       '11 Carr Road, Three Kings, Auckland 1042',
                       textAlign: TextAlign.left,
                       style: TextStyle(fontSize: 16.0, color: Colors.black),
                     ),
                   ),
                   Padding(
                       padding: EdgeInsets.only(
                           left: 24.0, top: 15.0, right: 24.0, bottom: 16.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [

                           RoundedLoadingButton(
                             child: Text('Check OTP', style: TextStyle(color: Colors.white)),
                             controller: _btnController,
                             onPressed: () async {

                               _btnController.start();
                               await Future.delayed(const Duration(seconds: 5), () {
                                 setState(() {
                                   Navigator.pop(context);
                                   _btnController.success();
                                   _acceptride =true;
                                   _goLivetomSheet();
                                 });
                               });

                             }
                           ),

                         ],
                       )),
                 ],
               )); // returns your BottomSheet widget
        });
  }
  void _goLivetomSheet() {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return //MyBottomSheetLayout();
            Container(
               width: double.infinity,
               child: new Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[

                   Padding(
                       padding: EdgeInsets.only(
                           left: 24.0, top: 15.0, right: 24.0, bottom: 16.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                             child: RaisedButton(
                               color: Colors.green,
                               child: Text('GoLive mapRoute',
                                   style: TextStyle(
                                       fontSize: 16.0,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white)),
                               onPressed: () async {

                                 final _originNOw = WayPoint(
                                     name:  "start",
                                     latitude: _originLatitude,
                                     longitude: _originLongitude);
                                 final _destinatn = WayPoint(
                                     name: "desttination",
                                     latitude: _destLatitude,
                                     longitude: _destLongitude);
                                 var wayPoints = List<WayPoint>();
                                 wayPoints.add(_originNOw);
                                 wayPoints.add(_destinatn);

                                 await _directions.startNavigation(
                                     wayPoints: wayPoints,
                                     options: MapBoxOptions(
                                         mode:
                                         MapBoxNavigationMode.drivingWithTraffic,
                                         simulateRoute: true,
                                         language: "en",
                                         units: VoiceUnits.metric));

                               },
                             ),
                           ),

                         ],
                       )),
                 ],
               )); // returns your BottomSheet widget
        });
  }

  void displayModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  void GoToAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Go To turned on "),
            content: Text(
                "If you do not receive a booking in the next 60 mins Go To will be turned off.\n\nNo. of Go-To bookings remainingtoday: 3"),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                    // one =true;
                    // two =true;
                    // three =false;
                  },
                  child: Text("Cancel")),
              CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    // setState(() {
                    //   one = true;
                    //   two = true;
                    //   three = false;
                    // });
                    Navigator.pop(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => currentLoc()
                        ));


                    //gotoDialog(context);

                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    // prefs.remove('isLogin');
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }

  void showAlertDialog1(BuildContext context) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Confirmation"),
            content: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text("Do you Want to Switch the ON DUTY ?"),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  child: Text("Cancel")),
              CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.green),
                  isDefaultAction: true,
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('DUTY', "ON DUTY");
                    await prefs.setBool('_getRide', true);
                    setState(()   {
                      DUTY = "ON DUTY";
                      checkride =true;
                      // _showMyBottomSheet();
                      cnst.successToast("Camera not supported now",context);
                    });
                    Navigator.pop(context);

                    // await Future.delayed(const Duration(seconds: 5), () {
                    //   setState(() {
                    //     _acceptride=false;
                    //   });
                    // });


                   /* File file = cnst.cmera(context).then((value) {
                      print("imae $value");
                      setState(() async {
                        one = true;
                        two = false;
                        three = true;
                        _acceptride=false;
                        _showMyBottomSheet();
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('DUTY', "ON DUTY");

                        Navigator.pop(context);

                      });
                    });*/


                    // await Future.delayed(const Duration(seconds: 30), () {
                    // await Future.delayed(const Duration(seconds: 5), () {
                    //   setState(() {
                    //     _acceptride=false;
                    //     _controllerL.start();
                    //     _showMyBottomSheet();
                    //   });
                    // });
                    // Navigator.pop(context);

                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    // prefs.remove('isLogin');
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
                  },
                  child: Text("Yes")),
            ],
          );
        });
  }
  void offDuyAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Alert"),
            content: Text("Are you close the Duty??"),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                    // one =true;
                    // two =true;
                    // three =false;
                  },
                  child: Text("Cancel")),
              CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('DUTY', "OFF DUTY");
                    await prefs.setBool('_getRide', false);
                    setState(() {
                      DUTY = "OFF DUTY";
                      one = false;
                      two = true;
                      three = true;
                      _acceptride =true;
                    });
                    Navigator.pop(context);

                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    // prefs.remove('isLogin');
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }

  void gotoDialog(BuildContext context) {
    Alert(
        context: context,
        title: "Goto Place",
        content: Container(
          // height: 40,
          // width: 500,
          child: GooglePlaceAutoCompleteTextField(
              textEditingController: _address,
              googleAPIKey: Secrets.API_KEY,
              inputDecoration: _decoration("Enter Your destination Address"),
              // InputDecoration(hintText: "Search your location"),
              debounceTime: 800,
              countries: ["in", "fr"],
              isLatLngRequired: true,
              getPlaceDetailWithLatLng: (Prediction prediction) async {
                list.clear();
                print("placeDetails" +
                    prediction.lng.toString() +
                    prediction.lng.toString());
                setState(() async {
                  lat = "${prediction.lat.toString()}";
                  long = "${prediction.lng.toString()}";
                  await list.add(lat + " " + long);
                  pass = prediction.description;
                  await list.add(pass);
                  print("kkkkk");
                  print(prediction);
                  String a = prediction.description
                      .split(",")
                      .sublist(0, 1)
                      .toString();
                });
              },
              itmClick: (Prediction prediction) async {
                _address.text = prediction.description;

                _address.selection = TextSelection.fromPosition(
                    TextPosition(offset: prediction.description.length));
              }
              // default 600 ms ,
              ),
        ),
        buttons: [
          DialogButton(
            onPressed: () {

              _address.text.isEmpty?
              setState(() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('DUTY', "OFF DUTY");
                DUTY = "GO TO";
                one = true;
                two = true;
                three = false;
                Navigator.pop(context);

              }): cnst.successToast("PLease Find goTo Location",context);

            },
            child: Text(
              "save",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _decoration(String s) {
    return new InputDecoration(
        // counterText: '',
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: new TextStyle(color: Colors.grey[800]),
        hintText: s,
        fillColor: Colors.white70);
  }

  ridestart() async {
    print("_originLatitude.isFinite");
    if(_originLatitude!=0&&_originLongitude!=0&&_destLatitude!=0&&_destLongitude!=0){
      markers.clear();
      polylines.clear();
      polylineCoordinates.clear();
      setState(() {
        // _loadingHide =false;
        // _searchHide =true;

      });

      /// origin marker
      _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
          BitmapDescriptor.defaultMarker);

      /// destination marker
      _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
          BitmapDescriptor.defaultMarkerWithHue(90));
      _getPolyline();


      await Timer(const Duration(seconds: 20), () {
        setState(() {
          // _loadingHide =true;

        });
      });

      // _routeHide? Text(""):

      await Timer(const Duration(seconds: 15), () {
        setState(() {
          // _loadEmergency =false;
          // _loadingHide =true;
          // _searchHide =true;
          // _routeHide =false;
          // btm = true;
          // displayBottomSheet(context);

        });
      });
    }else{
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: false,
          title: 'Error',
          desc:
          'Location Not Selected',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
        ..show();
    }
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }


  String _startAddress = '';
  String _destinationAddress = '';
  String _placeDistance="";

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY,
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.walking,
      // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
    ).catchError((onError){
      print("\nAn Error Occured Possibly dure to network issues\n $onError");
    });

    print("rrrrrrrrrrrrr ${result.points}");
    print("rrrrrrrrrrrrr ${result.status}");
    print("rrrrrrrrrrrrr ${result.errorMessage}");
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
    double totalDistance = 0.0;

    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    setState(() {
      _placeDistance = totalDistance.toStringAsFixed(2);
      print('DISTANCE: $_placeDistance km');
    });
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }



  MapBoxNavigation _directions;
  MapBoxOptions _options;
  bool _searchHide = false;
  bool _routeHide =true;
  bool _loadingHide =true;
  String _platformVersion = 'Unknown';
  String _instruction = "";
  bool _loadEmergency = true;

  bool _selectBtn =false;
  bool btm =true;


  bool _arrived = false;
  bool _isMultipleStop = false;
  double _distanceRemaining, _durationRemaining;
  MapBoxNavigationViewController _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;


  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await _directions.distanceRemaining;
    _durationRemaining = await _directions.durationRemaining;

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        _arrived = progressEvent.arrived;
        if (progressEvent.currentStepInstruction != null)
          _instruction = progressEvent.currentStepInstruction;
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {
          _routeBuilt = true;
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {
          _routeBuilt = false;
        });
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
        });
        break;
      case MapBoxEvent.on_arrival:
        _arrived = true;
        if (!_isMultipleStop) {
          await Future.delayed(Duration(seconds: 3));
          await _controller.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        setState(() {
          _routeBuilt = false;
          _isNavigating = false;
        });
        break;
      default:
        break;
    }
    setState(() {});
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initialize() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      _searchHide = false;
      _routeHide =true;
      _loadingHide =true;
    });

    _directions = MapBoxNavigation(onRouteEvent: _onEmbeddedRouteEvent);
    _options = MapBoxOptions(
      //initialLatitude: 36.1175275,
      //initialLongitude: -115.1839524,
        zoom: 15.0,
        tilt: 0.0,
        bearing: 0.0,
        enableRefresh: false,
        alternatives: true,
        voiceInstructionsEnabled: true,
        bannerInstructionsEnabled: true,
        allowsUTurnAtWayPoints: true,
        mode: MapBoxNavigationMode.drivingWithTraffic,
        units: VoiceUnits.imperial,
        simulateRoute: false,
        animateBuildRoute: true,
        longPressDestinationEnabled: true,
        language: "en");

    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await _directions.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  int _otpCodeLength = 4;
  String _otpCode = "";

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {

      } else if (otpCode.length == _otpCodeLength && !isAutofill) {

      } else {

      }
    });
  }


  String _img,url;


  Future<String> uploadImage() async {

    var request = http.MultipartRequest('POST', Uri.parse('$url'));
    request.fields.addAll({
      'carWithDriverId': '1',
      'latitude': '1',
      'longitude': '1'
    });
    request.files.add(await http.MultipartFile.fromPath('selfiePicImage', '/C:/Users/maAsh/Documents/Lightshot/Screenshot_2.png'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

  void _completerd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Alert"),
            content: Text("Ride is Completed everything??"),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  child: Text("NO")),
              CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('_getRide',  true);
                    prefs.commit();
                    setState(()  {
                      _liveRoute =!_liveRoute;
                      checkride =true;
                    });
                    Navigator.pop(context);
                  },
                  child: Text("YES")),
            ],
          );
        });
  }

  void _checkBill() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Alert"),
            content: Text("want see Bill??"),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  child: Text("NO")),
              CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: ()  {
                    setState(() {
                      _acceptride =!_acceptride;

                    });
                    print('button clicked');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => billCheck()
                        ));
                  },
                  child: Text("YES")),
            ],
          );
        });
  }




}
