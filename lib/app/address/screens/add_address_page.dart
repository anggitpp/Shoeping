import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';

import '../widgets/add_address_modal_bottom_sheet.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  double latitude = -6.921651290622819;
  double longitude = 107.60614356727619;
  bool isLoadedMaps = false;

  @override
  void initState() {
    super.initState();

    getUserLocation();
  }

  Future<void> getUserLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    Geolocator.getCurrentPosition().then((value) {
      setState(() {
        latitude = value.latitude;
        longitude = value.longitude;
        isLoadedMaps = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> mapsController = Completer();

    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 18,
    );

    List<Marker> markers = <Marker>[];

    markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: 'Masjid Raya Bandung')));
    return Scaffold(
      body: Stack(
        children: [
          isLoadedMaps
              ? GoogleMap(
                  mapType: MapType.terrain,
                  initialCameraPosition: kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    mapsController.complete(controller);
                  },
                  onTap: (LatLng lng) {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return const AddAddressModalBottomSheet();
                        });
                  },
                  markers: Set<Marker>.of(markers),
                )
              : DefaultLoadingProgress(),
          Align(
            alignment: const Alignment(-0.8, -0.85),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
