import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(home: GoogleMapScreen()));
}

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(21.640476, 69.606054);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marker Demo'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _createMarker(),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          myLocationEnabled: true,
        ),
      ),
    );
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _center,
          infoWindow: InfoWindow(title: 'Marker 1')),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(23.022505, 72.571365),
      ),
    };
  }
}
