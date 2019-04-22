import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget{
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  MapScreenState createState() {
    return new MapScreenState();
  }
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  Widget showMap(){
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: MapScreen._kGooglePlex,
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showMap(),
    );
  }
}
