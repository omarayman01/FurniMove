import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapLocation extends StatefulWidget {
  const MapLocation({
    super.key,
  });

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  LatLng? currentPosition;

  final locationController = Location();
  // static const sourceLocation = LatLng(30.011192943741968, 31.1986617079639);
  Marker? marker;
  void onMapTap(LatLng position) {
    setState(() {
      marker = Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: InfoWindow(
          title: 'Selected Location',
          snippet: position.toString(),
        ),
      );
      debugPrint("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      debugPrint(marker.toString());
    });
  }

  @override
  void initState() {
    fetchLocationUpdates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(text),
        // ),
        body: currentPosition == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentPosition!,
                    zoom: 13,
                  ),
                  markers: marker != null ? {marker!} : {},
                  onTap: onMapTap,
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  child: Column(
                    children: [
                      Text(
                        'Save',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blueAccent),
                        child: IconButton(
                            onPressed: () async {
                              if (currentPosition != null) {
                                Navigator.pop(context, marker!.position);
                              } else {
                                Navigator.pop(context, Null);
                              }
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                )
              ]));
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
        // print(currentPosition);
      }
    });
  }
}
