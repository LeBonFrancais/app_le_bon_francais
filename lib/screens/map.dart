import 'package:app_le_bon_francais/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(47.454575, -0.559379), zoom: 11.5);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: BtmAppBar(),
        body: GoogleMap(
          myLocationButtonEnabled: false,
          initialCameraPosition: _initialCameraPosition,
        ));
  }
}
