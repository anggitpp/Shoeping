import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:shoeping/app/address/repositories/address_repository.dart';
import 'package:shoeping/app/authentication/models/user_address.dart';
import 'package:shoeping/shared/models/custom_error.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepository addressRepository;
  AddressCubit({
    required this.addressRepository,
  }) : super(AddressState.initial());

  Future<void> getUserLocation() async {
    emit(state.copyWith(getLocationStatus: GetLocationStatus.loading));
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    await getDetailLocation(position.latitude, position.longitude);

    emit(state.copyWith(getLocationStatus: GetLocationStatus.success));
  }

  Future<void> getDetailLocation(
      double locLatitude, double locLongitude) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locLatitude, locLongitude,
        localeIdentifier: 'id');
    emit(
      state.copyWith(
          addressLat: locLatitude,
          addressLong: locLongitude,
          placemark: placemarks[0],
          markName: placemarks[0].name),
    );
  }

  Future<void> storeAddress(UserAddress address) async {
    emit(state.copyWith(addressStatus: AddressStatus.loading));
    try {
      await addressRepository.storeAddress(address);

      emit(state.copyWith(addressStatus: AddressStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(addressStatus: AddressStatus.error, error: e),
      );
    }
  }

  Future<void> setPrimaryAddress(value) async {
    emit(state.copyWith(isPrimaryAddress: value));
  }
}
