import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';
import 'package:shoeping/shared/widgets/error_dialog.dart';

import '../cubit/address_cubit.dart';
import '../widgets/add_address_modal_bottom_sheet.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final Completer<GoogleMapController> mapsController = Completer();

  @override
  void initState() {
    super.initState();

    context.read<AddressCubit>().getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state.addressStatus == AddressStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        CameraPosition kGooglePlex = CameraPosition(
          target: LatLng(state.addressLat, state.addressLong),
          zoom: 18,
        );
        Marker marker = Marker(
            markerId: const MarkerId('marker'),
            position: LatLng(state.addressLat, state.addressLong),
            infoWindow: InfoWindow(title: state.markName),
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return AddAddressModalBottomSheet(state.placemark!);
                  });
            });
        return Scaffold(
          body: Stack(
            children: [
              state.getLocationStatus == GetLocationStatus.success
                  ? GoogleMap(
                      mapType: MapType.terrain,
                      initialCameraPosition: kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        mapsController.complete(controller);
                      },
                      onTap: (LatLng lng) {
                        context
                            .read<AddressCubit>()
                            .getDetailLocation(lng.latitude, lng.longitude)
                            .then((value) {
                          Timer(const Duration(milliseconds: 500), () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return AddAddressModalBottomSheet(
                                      state.placemark!);
                                });
                          });
                        });
                      },
                      markers: {marker},
                    )
                  : const DefaultLoadingProgress(),
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
      },
    );
  }
}
