// import 'package:dartz/dartz_streaming.dart';
// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_current_offer.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/current_move/current_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/end_move/end_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/start_move/start_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/update_truck_location/update_truck_location_cubit.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';
// // import 'package:location/location.dart';
// import 'package:url_launcher/url_launcher.dart';

class RequestMapScreen extends StatefulWidget {
  const RequestMapScreen({
    super.key,
    this.request,
  });
  final RequestModel? request;

  @override
  State<RequestMapScreen> createState() => _RequestMapScreenState();
}

class _RequestMapScreenState extends State<RequestMapScreen> {
  Map<PolylineId, Polyline> polylines = {};
  LatLng? currentPosition;
  final locationController = Location();
  int cnt = 0;

  // LatLng? sourceLocation = null;
  // LatLng? destinationLocation = null;
  // widget,re

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initMap();
    });
    super.initState();
  }

  Future<void> initMap() async {
    print(widget.request!.endLocation.toString());
    print(widget.request!.startLocation.toString());
    // await Future.delayed(const Duration(seconds: 5));
    // Timer.periodic(const Duration(seconds: 10), (timer) async {
    //   await fetchLocationUpdates();
    // });
    Timer.periodic(const Duration(seconds: 5), (timer) {
      fetchLocationUpdates2();
    });

    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates, Colors.blueAccent);
  }

  @override
  Widget build(BuildContext context) {
    print(currentPosition.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Move Location'),
      ),
      body: currentPosition == null
          //  && widget.request == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.request!.startLocation!.latitude!,
                        widget.request!.startLocation!.longitude!),
                    zoom: 10,
                  ),
                  markers: {
                    Marker(
                        markerId: const MarkerId('currentLocation'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen),
                        position: currentPosition!),
                    Marker(
                        markerId: const MarkerId('SourceLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: LatLng(
                            widget.request!.startLocation!.latitude!,
                            widget.request!.startLocation!.longitude!)),
                    Marker(
                        markerId: const MarkerId('DestinationLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: LatLng(widget.request!.endLocation!.latitude!,
                            widget.request!.endLocation!.longitude!)),
                    // Marker(
                    //     markerId: const MarkerId('DestinationLocation'),
                    //     icon: BitmapDescriptor.defaultMarker,
                    //     position: LatLng(30.1738695, 31.6412333))
                  },
                  polylines: Set<Polyline>.of(polylines.values),
                ),
                Positioned(
                  bottom: 20,
                  right: 60,
                  child: Column(
                    children: [
                      Text(
                        'Destination',
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
                              await launchUrl(Uri.parse(
                                  'google.navigation:q=${widget.request!.endLocation!.latitude!},${widget.request!.endLocation!.longitude!}'));

                              Navigator.pop(context, true);
                            },
                            icon: const Icon(
                              Icons.navigation_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  child: Column(
                    children: [
                      Text(
                        'Source',
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
                              await launchUrl(Uri.parse(
                                  'google.navigation:q=${widget.request!.startLocation!.latitude!},${widget.request!.startLocation!.longitude!}'));
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.navigation_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () async {
                      if (widget.request!.status == 'Waiting') {
                        context
                            .read<StartMoveCubit>()
                            .startMove(user, widget.request!.id!);

                        print(widget.request!.status);
                        await context
                            .read<CurrentMoveCubit>()
                            .fetchCurrentMove(user);
                        // Timer(Duration(seconds: 5), () {});
                        Navigator.pop(context);
                      } else if (widget.request!.status == 'Ongoing') {
                        await context
                            .read<EndMoveCubit>()
                            .endMove(user, widget.request!.id!);

                        print(widget.request!.status);

                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                        color: widget.request!.status == "Waiting"
                            ? AppTheme
                                .green // AppTheme.primarylight can be replaced with Colors.blue
                            : widget.request!.status == "Ongoing"
                                ? AppTheme.red
                                : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          widget.request!.status == "Waiting" ? 'Start' : 'End',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppTheme.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> fetchLocationUpdates2() async {
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
    locationController.onLocationChanged.listen((currentLocation) async {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
        await Duration(seconds: 2);
        context.read<UpdateTruckLocationCubit>().updateTruckLocation(user, {
          "latitude": currentPosition!.latitude,
          "longitude": currentPosition!.longitude,
        });
        print(currentPosition);
      }
    });
  }

  // Future<void> fetchLocationUpdates() async {
  //   bool serviceEnabled;
  //   LocationPermission permissionGranted;
  //   Position? previousPos;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled =
  //         await Geolocator.requestPermission() != LocationPermission.denied;
  //     if (!serviceEnabled) {
  //       return;
  //     }
  //   }
  //   permissionGranted = await Geolocator.checkPermission();
  //   if (permissionGranted == LocationPermission.denied) {
  //     permissionGranted = await Geolocator.requestPermission();
  //     if (permissionGranted == LocationPermission.deniedForever ||
  //         permissionGranted == LocationPermission.denied) {
  //       return;
  //     }
  //   }

  //   try {
  //     print('IN TRYYYYYYYYYYYYYYYYYYYYYYY');

  //     Position current = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.low);
  //     currentPosition = LatLng(current.latitude, current.longitude);
  //     print('Initial Position: ${current.latitude}, ${current.longitude}');
  //   } catch (e) {
  //     print('Error getting initial position: $e');
  //     return;
  //   }

  //   // LocationSettings locationSettings = const LocationSettings(
  //   //     accuracy: LocationAccuracy.low,
  //   //     // distanceFilter: 1,
  //   //     timeLimit: Duration(seconds: 2));
  //   Geolocator.getPositionStream().listen((currentLocation) async {
  //     late double distancee;
  //     if (currentLocation != null) {
  //       if (previousPos != null) {
  //         distancee = Geolocator.distanceBetween(
  //           previousPos!.latitude,
  //           previousPos!.longitude,
  //           currentLocation.latitude,
  //           currentLocation.longitude,
  //         );
  //         // if (distancee >= 1) {
  //         //   print(
  //         //       "Changedddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
  //         // }
  //       }
  //       previousPos = currentLocation;
  //       // print(
  //       //     'OMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARRRRRRRRRRRRRRRRRRRRRRRRRRRRR');
  //       // print(currentPosition);
  //       // print(
  //       //     'Distanceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
  //       print("beforeeee");
  //       await Future.delayed(const Duration(seconds: 10));
  //       print("afterrrrrrrrr");
  //       await Future.delayed(const Duration(seconds: 10));

  //       Timer.periodic(const Duration(seconds: 20), (timer) {
  //         setState(() async {
  //           await Future.delayed(const Duration(seconds: 10));
  //           currentPosition =
  //               LatLng(currentLocation.latitude, currentLocation.longitude);
  //           await Future.delayed(const Duration(seconds: 10));
  //           context.read<UpdateTruckLocationCubit>().updateTruckLocation(user, {
  //             "latitude": currentPosition!.latitude,
  //             "longitude": currentPosition!.longitude,
  //           });
  //           await Future.delayed(const Duration(seconds: 10));
  //         });
  //       });
  //     }
  //   });
  // }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    PolylineRequest request = PolylineRequest(
      origin: PointLatLng(widget.request!.startLocation!.latitude!,
          widget.request!.startLocation!.longitude!),
      destination: PointLatLng(widget.request!.endLocation!.latitude!,
          widget.request!.endLocation!.longitude!),
      mode: TravelMode.driving,
    );

    final result = await polylinePoints.getRouteBetweenCoordinates(
      request: request,
      googleApiKey: EndPoints.googleApiKey,
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates, Color color) async {
    const id = PolylineId('polyline');
    final polyline = Polyline(
        polylineId: id, color: color, points: polylineCoordinates, width: 5);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
