import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:app_le_bon_francais/widgets/btmappbar.dart';
//import 'package:geolocation/geolocation.dart';
//import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  final MapController controller = MapController();

/*  getPermission() async{
    final GeolocationResult result = await Geolocation.requestLocationPermission(
      permission: const LocationPermission(
        android: LocationPermissionAndroid.fine,
        ios: LocationPermissionIOS.always)
    );
    return result;
  }

  getLocation() {
    return getPermission().then((result) async{
      if (result.isSuccessful){
        // ignore: unused_local_variable
        final coords = Geolocation.currentLocation(accuracy: LocationAccuracy.best);
      }
    });
  }

  buildMap(){
    getLocation().then((response) {
      if (response.isSuccessful) {
        response.listen((value) {
          controller.move(LatLng(value.location.latitude, value.location.longitude),15.0);
        });
      }
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BtmAppBar(),
        /*body:  FlutterMap(
          mapController: controller,
          options: MapOptions(zoom: 10.0),
          layers: [
            TileLayerOptions(
              minZoom: 1,
              maxZoom: 50,
              backgroundColor: Colors.black,
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
          ]
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
