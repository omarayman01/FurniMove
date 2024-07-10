import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/get_truck_location/get_truck_location_cubit.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class CustomerTrackingScreen extends StatefulWidget {
  const CustomerTrackingScreen({super.key, this.request});
  final RequestModel? request;
  @override
  State<CustomerTrackingScreen> createState() => _CustomerTrackingScreenState();
}

class _CustomerTrackingScreenState extends State<CustomerTrackingScreen> {
  Map<PolylineId, Polyline> polylines = {};

  //----------------------------------------
  LatLng? currentPosition;
  LatLng? truckPos;

  // final locationController = Location();

  // LatLng? sourceLocation = null;
  // LatLng? destinationLocation = null;
  // widget,re

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // print(sourceLocation.toString());
      // print(destinationLocation.toString());

      await initMap();
    });
    super.initState();
  }

  Future<void> initMap() async {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      fetchLocationUpdates();
    });
    // await fetchLocationUpdates();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates, Colors.blueAccent);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetTruckLocationCubit, GetTruckLocationState>(
        listener: (context, state) {
          if (state is GetTruckLocationSuccess) {
            truckPos =
                LatLng(state.location.latitude, state.location.longitude);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tracking Move'),
          ),
          body: widget.request == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.request!.startLocation!.latitude!,
                        widget.request!.startLocation!.longitude!),
                    zoom: 10,
                  ),
                  markers: {
                    if (truckPos != null)
                      Marker(
                          markerId: const MarkerId('currentLocation'),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          position: truckPos!),
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
                            widget.request!.endLocation!.longitude!))
                  },
                  polylines: Set<Polyline>.of(polylines.values),
                ),
        ));
  }

  // Future<void> fetchLocationUpdates() async {
  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;
  //   serviceEnabled = await locationController.serviceEnabled();
  //   if (serviceEnabled) {
  //     serviceEnabled = await locationController.requestService();
  //   } else {
  //     return;
  //   }

  //   permissionGranted = await locationController.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await locationController.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //   locationController.onLocationChanged.listen((currentLocation) {
  //     if (currentLocation.latitude != null &&
  //         currentLocation.longitude != null) {
  //       setState(() {
  //         currentPosition =
  //             LatLng(currentLocation.latitude!, currentLocation.longitude!);
  //       });
  //       // context.read<UpdateTruckLocationCubit>().updateTruckLocation(user, {
  //       //   "latitude": currentPosition!.latitude,
  //       //   "longitude": currentPosition!.longitude,
  //       // });
  //       print(currentPosition);
  //     }
  //   });
  // }

  Future<void> fetchLocationUpdates() async {
    setState(() {
      context
          .read<GetTruckLocationCubit>()
          .fetchTruckLocation(user, widget.request!.truckId!);
    });
  }

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
