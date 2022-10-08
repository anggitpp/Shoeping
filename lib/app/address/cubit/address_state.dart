part of 'address_cubit.dart';

enum GetLocationStatus { initial, loading, success, failure }

enum AddressStatus { initial, loading, success, error }

double latitude = -6.921651290622819;
double longitude = 107.60614356727619;
String markName = 'Masjid Raya Bandung';
bool isLoadedMaps = false;
Placemark? placemark;

class AddressState extends Equatable {
  final double addressLong;
  final double addressLat;
  final GetLocationStatus getLocationStatus;
  final AddressStatus addressStatus;
  final Placemark? placemark;
  final String markName;
  final bool isPrimaryAddress;
  final CustomError error;
  const AddressState({
    required this.addressLong,
    required this.addressLat,
    required this.getLocationStatus,
    required this.addressStatus,
    this.placemark,
    required this.markName,
    required this.isPrimaryAddress,
    required this.error,
  });

  factory AddressState.initial() {
    return const AddressState(
      addressLong: -6.921651290622819,
      addressLat: 107.60614356727619,
      getLocationStatus: GetLocationStatus.initial,
      addressStatus: AddressStatus.initial,
      markName: 'Masjid Raya Bandung',
      isPrimaryAddress: true,
      error: CustomError(),
    );
  }

  AddressState copyWith({
    double? addressLong,
    double? addressLat,
    GetLocationStatus? getLocationStatus,
    AddressStatus? addressStatus,
    Placemark? placemark,
    String? markName,
    bool? isPrimaryAddress,
    CustomError? error,
  }) {
    return AddressState(
      addressLong: addressLong ?? this.addressLong,
      addressLat: addressLat ?? this.addressLat,
      getLocationStatus: getLocationStatus ?? this.getLocationStatus,
      addressStatus: addressStatus ?? this.addressStatus,
      placemark: placemark ?? this.placemark,
      markName: markName ?? this.markName,
      isPrimaryAddress: isPrimaryAddress ?? this.isPrimaryAddress,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'AddressState(addressLong: $addressLong, addressLat: $addressLat, getLocationStatus: $getLocationStatus, addressStatus: $addressStatus, placemark: $placemark, markName: $markName, isPrimaryAddress: $isPrimaryAddress, error: $error)';
  }

  @override
  List<Object> get props {
    return [
      addressLong,
      addressLat,
      getLocationStatus,
      addressStatus,
      placemark ?? '',
      markName,
      isPrimaryAddress,
      error,
    ];
  }
}
