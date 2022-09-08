import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/add_address_modal_bottom_sheet.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> mapsController = Completer();

    const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(-6.921651290622819, 107.60614356727619),
      zoom: 18,
    );

    List<Marker> markers = <Marker>[];

    markers.add(const Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(-6.921651290622819, 107.60614356727619),
        infoWindow: InfoWindow(title: 'Masjid Raya Bandung')));
    return Scaffold(
      body: GoogleMap(
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
      ),
    );
  }
}
