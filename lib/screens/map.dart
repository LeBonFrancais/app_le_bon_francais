import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:geolocation/geolocation.dart';
import 'package:latlong2/latlong.dart';

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
      bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: const Icon(Icons.home), onPressed: () {
                Navigator.pushNamed(context, '/');
              },),
              IconButton(icon: const Icon(Icons.search), onPressed: () {
                Navigator.pushNamed(context, 'ResearchScreen');
              },),
              IconButton(icon: const Icon(Icons.map),
                color: Colors.white,
                onPressed: () {},),
              IconButton(
                icon: const Icon(Icons.account_circle_outlined), onPressed: () {
                Navigator.pushNamed(context, 'LoginScreen');
              },),
            ],
          ),
          shape: const CircularNotchedRectangle(),
          color: Colors.redDark
      ),
      body:  FlutterMap(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
