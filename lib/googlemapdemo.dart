import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(MaterialApp(home: GoogleMapScreen()));
}

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController mapController;
  LatLng currentPostion;
  var location = Location();
  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationController.stream;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    locationService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Marker Demo'),
          backgroundColor: Colors.red[400],
          centerTitle: true,
          actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: _add)],
        ),
        body: Container(
          child: GoogleMap(
            polylines: Set<Polyline>.of(_mapPolylines.values),
            onMapCreated: _onMapCreated,
            markers: _createMarker(),
            initialCameraPosition: CameraPosition(
              target: currentPostion,
              zoom: 15.0,
            ),
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ),
      ),
    );
  }

  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;
  void _add() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.blue,
      width: 5,
      points: points,
    );

    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
  }

  final List<LatLng> points = <LatLng>[];

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: currentPostion,
          infoWindow: InfoWindow(title: 'You')),
    };
  }

  locationService() {
    // Request permission to use location
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            print(locationData.latitude);
            print(locationData.longitude);
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));

            setState(() {
              points.add(LatLng(locationData.latitude, locationData.longitude));
              _add();
            });
          }
        });
      }
    });
  }

  getLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentPostion = LatLng(
          userLocation.latitude,
          userLocation.longitude,
        );
        points.add(currentPostion);
        _add();
      });
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
  }
}

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});
}
