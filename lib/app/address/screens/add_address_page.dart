import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoeping/app/authentication/models/user_address.dart';
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

  UserAddress? userAddress;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments == null) {
        context.read<AddressCubit>().getUserLocation();
      } else {
        setState(() {
          userAddress = (ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>)['address'];

          context.read<AddressCubit>().setPrimaryAddress(
              userAddress!.status == StatusAddress.secondary ? false : true);

          context.read<AddressCubit>().getDetailLocation(
              double.parse(userAddress!.latitude),
              double.parse(userAddress!.longitude));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state.addressStatus == AddressStatus.error) {
          errorDialog(context, state.error);
        }

        if (state.changeAddressStatus == ChangeAddressStatus.success) {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return AddAddressModalBottomSheet(
                  state.placemark!,
                  userAddress: userAddress,
                );
              });
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
                    return AddAddressModalBottomSheet(
                      state.placemark!,
                      userAddress: userAddress,
                    );
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
                        if (!mapsController.isCompleted) {
                          mapsController.complete(controller);
                        }
                      },
                      onTap: (LatLng lng) {
                        context
                            .read<AddressCubit>()
                            .changeLocation(lng.latitude, lng.longitude);
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
