import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indcabdriver/Screens/account/account.dart';
import 'package:indcabdriver/Screens/home/cartype.dart';
import 'package:indcabdriver/Screens/home/homePage.dart';
import 'package:indcabdriver/Screens/incentive/incentive.dart';
import 'package:indcabdriver/Screens/profile/profile.dart';
import 'package:indcabdriver/Screens/support/support.dart';
import 'package:indcabdriver/widgets/appbarCustome.dart';
import 'package:indcabdriver/widgets/custumColors.dart';


// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:indcab/widgets/secrets.dart';
// import 'package:toast/toast.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}
class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

final tabs =[
  homePage1(),
  account(),
  incentive(),
  // incentive(),
  support(),
  profile()

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: tabs[_selectedIndex],
      // Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/steering.svg",color: _selectedIndex==0?MyColors.themeClr:Colors.black45,
            ),
            title: Text('Duty'),
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(
              "assets/icons/che.svg",color: _selectedIndex==1?MyColors.themeClr:Colors.black45,
            ),

            title: Text('Accounts'),
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset("assets/icons/money.svg",color: _selectedIndex==2?MyColors.themeClr:Colors.black45,),
            title: Text('Incentives'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/partnership.svg",color: _selectedIndex==3?MyColors.themeClr:Colors.black45,),
            title: Text('Support'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/profile.svg",color: _selectedIndex==4?MyColors.themeClr:Colors.black45,),
            title: Text('Profile'),
          ),
        ],
        type:BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.themeClr,
        onTap: _onItemTapped,
      ),
    );
  }
}

/*class _homePageState extends State<homePage> {

  GoogleMapController mapController;
  double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
  double _destLatitude = 6.849660, _destLongitude = 3.648190;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAaM2avq2Jn4q8m4lgOf5ZlxWZQ8Hw7W38";

  @override
  void initState() {
    super.initState();

    /// origin marker
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
        BitmapDescriptor.defaultMarker);

    /// destination marker
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));
    _getPolyline();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(_originLatitude, _originLongitude), zoom: 15),
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(markers.values),
            polylines: Set<Polyline>.of(polylines.values),
          )),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
}*/


/*class _homePageState extends State<homePage> {
  
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;

  Position _currentPosition;
  String _currentAddress;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String _placeDistance;

  Set<Marker> markers = {};

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _textField({
    TextEditingController controller,
    FocusNode focusNode,
    String label,
    String hint,
    double width,
    Icon prefixIcon,
    Widget suffixIcon,
    Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: new InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue[300],
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p =
      await placemarkFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(_startAddress);
      List<Location> destinationPlacemark = await locationFromAddress(_destinationAddress);

      print(_startAddress);
      print(_destinationAddress);
      print(_currentAddress);
      print(_currentPosition);
      print("_currentPosition");
      print(startPlacemark);
      print(destinationPlacemark);

      if (startPlacemark != null && destinationPlacemark != null) {
        // Use the retrieved coordinates of the current position,
        // instead of the address if the start position is user's
        // current position, as it results in better accuracy.
        Position startCoordinates = _startAddress == _currentAddress
            ? Position(latitude: _currentPosition.latitude, longitude: _currentPosition.longitude)
            : Position(
            latitude: startPlacemark[0].latitude, longitude: startPlacemark[0].longitude);
        Position destinationCoordinates = Position(
            latitude: destinationPlacemark[0].latitude,
            longitude: destinationPlacemark[0].longitude);

        // Start Location Marker
        Marker startMarker = Marker(
          markerId: MarkerId('$startCoordinates'),
          position: LatLng(
            startCoordinates.latitude,
            startCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Start',
            snippet: _startAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        // Destination Location Marker
        Marker destinationMarker = Marker(
          markerId: MarkerId('$destinationCoordinates'),
          position: LatLng(
            destinationCoordinates.latitude,
            destinationCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: _destinationAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        // Adding the markers to the list
        markers.add(startMarker);
        markers.add(destinationMarker);

        print('START COORDINATES: $startCoordinates');
        print('DESTINATION COORDINATES: $destinationCoordinates');

        Position _northeastCoordinates;
        Position _southwestCoordinates;

        // Calculating to check that the position relative
        // to the frame, and pan & zoom the camera accordingly.
        double miny = (startCoordinates.latitude <= destinationCoordinates.latitude)
            ? startCoordinates.latitude
            : destinationCoordinates.latitude;
        double minx = (startCoordinates.longitude <= destinationCoordinates.longitude)
            ? startCoordinates.longitude
            : destinationCoordinates.longitude;
        double maxy = (startCoordinates.latitude <= destinationCoordinates.latitude)
            ? destinationCoordinates.latitude
            : startCoordinates.latitude;
        double maxx = (startCoordinates.longitude <= destinationCoordinates.longitude)
            ? destinationCoordinates.longitude
            : startCoordinates.longitude;

        _southwestCoordinates = Position(latitude: miny, longitude: minx);
        _northeastCoordinates = Position(latitude: maxy, longitude: maxx);

        // Accommodate the two locations within the
        // camera view of the map
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: LatLng(
                _northeastCoordinates.latitude,
                _northeastCoordinates.longitude,
              ),
              southwest: LatLng(
                _southwestCoordinates.latitude,
                _southwestCoordinates.longitude,
              ),
            ),
            100.0,
          ),
        );

        // Calculating the distance between the start and the end positions
        // with a straight path, without considering any route
        // double distanceInMeters = await Geolocator().bearingBetween(
        //   startCoordinates.latitude,
        //   startCoordinates.longitude,
        //   destinationCoordinates.latitude,
        //   destinationCoordinates.longitude,
        // );

        await _createPolylines(startCoordinates, destinationCoordinates);

        double totalDistance = 0.0;

        // Calculating the total distance by adding the distance
        // between small segments
        print("totalDistance ${polylineCoordinates.length}");

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

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(Position start, Position destination) async {
    print("starrrrrrrrrrrrt");
    print(start);
    print(destination);
    double _originLatitude = 12.2958, _originLongitude = 76.6394;
    double _destLatitude = 12.9716, _destLongitude = 77.5946;
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
        // double _originLatitude = 12.2958, _originLongitude = 76.6394;
        // double _destLatitude = 12.9716, _destLongitude = 77.5946;
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
      // PointLatLng(12.2958, 76.6394,),
      // PointLatLng(12.9716, 77.5946),
      travelMode: TravelMode.transit,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
    );

    print("result ${result.points.length}");

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: markers != null ? Set<Marker>.from(markers) : null,
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
            // Show zoom buttons
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Show the place input fields & button for
            // showing the route
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Places',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: 10),
                          _textField(
                              label: 'Start',
                              hint: 'Choose starting point',
                              prefixIcon: Icon(Icons.looks_one),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.my_location),
                                onPressed: () {
                                  startAddressController.text = _currentAddress;
                                  _startAddress = _currentAddress;
                                },
                              ),
                              controller: startAddressController,
                              focusNode: startAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _startAddress = value;
                                });
                              }),
                          SizedBox(height: 10),
                          _textField(
                              label: 'Destination',
                              hint: 'Choose destination',
                              prefixIcon: Icon(Icons.looks_two),
                              controller: destinationAddressController,
                              focusNode: desrinationAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _destinationAddress = value;
                                });
                              }),
                          SizedBox(height: 10),
                          Visibility(
                            visible: _placeDistance == null ? false : true,
                            child: Text(
                              'DISTANCE: $_placeDistance km',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          RaisedButton(
                            onPressed: (_startAddress != '' && _destinationAddress != '')
                                ? () async {
                              startAddressFocusNode.unfocus();
                              desrinationAddressFocusNode.unfocus();
                              setState(() {
                                if (markers.isNotEmpty) markers.clear();
                                if (polylines.isNotEmpty) polylines.clear();
                                if (polylineCoordinates.isNotEmpty)
                                  polylineCoordinates.clear();
                                _placeDistance = null;
                              });

                              _calculateDistance().then((isCalculated) {
                                if (isCalculated) {

                                  Toast.show("Distance Calculated Sucessfully", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

                                  // Scaffold.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     content: Text('Distance Calculated Sucessfully'),
                                  //   ),
                                  // );
                                } else {
                                  Toast.show("Error Calculating Distance", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

                                  // Scaffold.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     content: Text('Error Calculating Distance'),
                                  //   ),
                                  // );
                                }
                              });
                            }
                                : null,
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Show Route'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Show current location button
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.orange[100], // button color
                      child: InkWell(
                        splashColor: Colors.orange, // inkwell color
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () {
                          mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                  _currentPosition.latitude,
                                  _currentPosition.longitude,
                                ),
                                zoom: 18.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

//   Completer<GoogleMapController> _mapController = Completer();
//   GoogleMapController mapController;
//   static LatLng latLng;
//   bool loading = true;
//
//   final Geolocator _geolocator = Geolocator();
//
// // For storing the current position
//   Position _currentPosition;
//
//
//
//   TextEditingController _from = TextEditingController();
//   TextEditingController _to = TextEditingController();
//
//   int _selectedIndex = 0;
//
//   _onSelected(int index) {
//     setState(() => _selectedIndex = index);
//   }
//
//   final List<String> _listViewData = [
//     "Daily",
//     "Rental",
//     "OutStation",
//     "Spare Driver",
//     "Family",
//     "Package Trip",
//     "Transport",
//   ];
//   Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: Scaffold(
//         drawer: drawer(),
//         appBar: AppBar(
//           backgroundColor: Color(0xffE1E3E9),
//           title:  Container(
//             height: 30,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 itemCount: _listViewData.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right:12.0),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal:8),
//                       height: 20,
//                       decoration: BoxDecoration(
//                         color: _selectedIndex != null && _selectedIndex == index
//                             ? Color(0xff247B1C)
//                             : Color(0xffE1E3E9),
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(30.0) //         <--- border radius here
//                         ),
//                       ),
//
//                       child: GestureDetector(
//                           onTap: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(builder: (_) => MapSample()//trips(title:_listViewData[index])
//                                 ));
//                             _onSelected(index);
//                           },
//                           child: Center(child: Text(_listViewData[index],
//                               style: TextStyle(fontSize: 14,color: _selectedIndex != null && _selectedIndex == index
//                               ? Colors.white
//                                 : Colors.black,)))
//                       ),),
//                   );
//                 }),),
//         ),
//
//         body: Stack(
//           children: [
//             GoogleMap(
//               myLocationEnabled: true,
//               myLocationButtonEnabled: false,
//               zoomGesturesEnabled: true,
//               zoomControlsEnabled: false,
//               mapType: MapType.normal,
//               initialCameraPosition: _kGooglePlex,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//             ),
//
//             ClipOval(
//               child: Material(
//                 color: Colors.orange[100], // button color
//                 child: InkWell(
//                   splashColor: Colors.orange, // inkwell color
//                   child: SizedBox(
//                     width: 56,
//                     height: 56,
//                     child: Icon(Icons.my_location),
//                   ),
//                   onTap: () {
//                     // TODO: Add the operation to be performed
//                     // on button tap
//                   },
//                 ),
//               ),
//             ),
//
//             // Padding(
//             //   padding: const EdgeInsets.all(18.0),
//             //   child: Container(
//             //     child: Column(
//             //       children: [
//             //         Container(
//             //             color: Colors.white,
//             //             padding: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
//             //             child: Column(
//             //               crossAxisAlignment: CrossAxisAlignment.start,
//             //               children: [
//             //                 Text("Pickup Location",style: _text(),),
//             //                 TextField(
//             //                   controller: _from,
//             //                   decoration: InputDecoration(
//             //                     filled: true,
//             //                     fillColor: Colors.white,
//             //                     hintText: '#104, Church Street, Koramangala, Bengaluru.',
//             //                     border: InputBorder.none,
//             //                     focusedBorder: InputBorder.none,
//             //                     enabledBorder: InputBorder.none,
//             //                     errorBorder: InputBorder.none,
//             //                     disabledBorder: InputBorder.none,
//             //                     contentPadding:
//             //                     EdgeInsets.only(left: 0, bottom: 0, top: 11, right: 15),
//             //                   ),
//             //                 ),
//             //               ],
//             //             )),SizedBox(height: 15,),
//             //         Container(
//             //             color: Colors.white,
//             //             padding: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
//             //             child: Column(
//             //               crossAxisAlignment: CrossAxisAlignment.start,
//             //               children: [
//             //                 Text("Drop Location",style: _text(),),
//             //                 TextField(
//             //                   controller: _to,
//             //                   decoration: InputDecoration(
//             //                     filled: true,
//             //                     fillColor: Colors.white,
//             //                     hintText: 'Where too?',
//             //                     border: InputBorder.none,
//             //                     focusedBorder: InputBorder.none,
//             //                     enabledBorder: InputBorder.none,
//             //                     errorBorder: InputBorder.none,
//             //                     disabledBorder: InputBorder.none,
//             //                     contentPadding:
//             //                     EdgeInsets.only(left: 0, bottom: 0, top: 11, right: 15),
//             //                   ),
//             //                 ),
//             //               ],
//             //             )),
//             //       ],
//             //     ),
//             //   ),
//             // )
//           ],
//         ),
//         // floatingActionButton: FloatingActionButton(
//         //   child: Icon(Icons.location_pin,size: 30,),
//         //   backgroundColor: Colors.green,
//         //   onPressed: () {
//         //     _goToTheLake();
//         //   },
//         //
//         // ),
//
//         ),
//
//     );
//   }
//
//   _getCurrentLocation() async {
//     await _geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//         .then((Position position) async {
//       setState(() {
//         // Store the position in the variable
//         _currentPosition = position;
//
//         print('CURRENT POS: $_currentPosition');
//
//         // For moving the camera to current location
//         mapController.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               target: LatLng(position.latitude, position.longitude),
//               zoom: 18.0,
//             ),
//           ),
//         );
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }
//
//   _text() {
//     return TextStyle(fontWeight: FontWeight.bold,color: Colors.grey, fontSize: 14);
//   }
// }
