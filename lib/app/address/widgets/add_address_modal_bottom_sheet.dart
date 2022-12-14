import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoeping/app/authentication/models/user_address.dart';
import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';
import 'package:shoeping/shared/widgets/default_text_field.dart';
import 'package:shoeping/shared/widgets/error_dialog.dart';
import 'package:shoeping/shared/widgets/header_page.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';
import '../../../shared/widgets/default_divider.dart';
import '../../../shared/widgets/submit_button_with_icon.dart';
import '../cubit/address_cubit.dart';

class AddAddressModalBottomSheet extends StatefulWidget {
  final UserAddress? userAddress;
  final Placemark placemark;
  const AddAddressModalBottomSheet(
    this.placemark, {
    this.userAddress,
    Key? key,
  }) : super(key: key);

  @override
  State<AddAddressModalBottomSheet> createState() =>
      _AddAddressModalBottomSheetState();
}

class _AddAddressModalBottomSheetState
    extends State<AddAddressModalBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    titleController.text = widget.userAddress?.title ?? '';
    nameController.text = widget.userAddress?.name ?? '';
    phoneController.text = widget.userAddress?.phoneNumber ?? '';
    addressController.text =
        '${widget.placemark.street}, ${widget.placemark.locality}';
    detailController.text = widget.userAddress?.detail ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state.addressStatus == AddressStatus.success) {
          BlocProvider.of<HomeCubit>(context).getUser().then((value) =>
              Navigator.popUntil(
                  context, (route) => route.settings.name == 'my-address'));
        }
        if (state.addressStatus == AddressStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        var detailCity = [
          widget.placemark.locality,
          widget.placemark.administrativeArea,
          widget.placemark.postalCode
        ].join(', ');
        return Container(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.defaultMargin),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              HeaderPage(
                'Detail Alamat',
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultMargin),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.placemark.subLocality!,
                      style: extraLargeTitleText.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      detailCity,
                      style: mediumText,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const DefaultDivider(),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Detail',
                      style: mediumText.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    DefaultTextField(
                        hintText: 'Nama',
                        icon: MdiIcons.receiptOutline,
                        controller: titleController),
                    DefaultTextField(
                        hintText: 'Penerima',
                        icon: Icons.person_outline,
                        controller: nameController),
                    DefaultTextField(
                        hintText: 'Nomor HP',
                        icon: Icons.phone_outlined,
                        controller: phoneController),
                    DefaultTextField(
                        hintText: 'Alamat',
                        icon: MdiIcons.mapMarkerOutline,
                        controller: addressController),
                    DefaultTextField(
                        hintText: 'Detail Alamat',
                        icon: MdiIcons.noteTextOutline,
                        controller: detailController),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Atur sebagai alamat utama',
                          style: mediumText,
                        ),
                        Switch(
                            value: state.isPrimaryAddress,
                            onChanged: (value) {
                              if (widget.userAddress?.status ==
                                  StatusAddress.primary) {
                                return;
                              }
                              context
                                  .read<AddressCubit>()
                                  .setPrimaryAddress(value);
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const DefaultDivider(),
                    const SizedBox(
                      height: 24,
                    ),
                    state.addressStatus != AddressStatus.loading
                        ? Column(
                            children: [
                              SubmitButtonWithIcon(
                                width: AppSizes.phoneWidthMargin(context),
                                color: mainColor,
                                text: 'Save Address',
                                icon: Icon(
                                  Icons.add,
                                  color: lighterBlack,
                                ),
                                onTap: () {
                                  var address = UserAddress(
                                      id: widget.userAddress != null
                                          ? widget.userAddress!.id
                                          : 1,
                                      userId: widget.userAddress != null
                                          ? widget.userAddress!.userId
                                          : 1,
                                      title: titleController.text,
                                      subtitle: detailCity,
                                      name: nameController.text,
                                      phoneNumber: phoneController.text,
                                      address: addressController.text,
                                      detail: detailController.text,
                                      longitude: state.addressLong.toString(),
                                      latitude: state.addressLat.toString(),
                                      status: state.isPrimaryAddress
                                          ? StatusAddress.primary
                                          : StatusAddress.secondary);

                                  //create or update
                                  widget.userAddress == null
                                      ? context
                                          .read<AddressCubit>()
                                          .storeAddress(address)
                                      : context
                                          .read<AddressCubit>()
                                          .updateAddress(address);
                                },
                              ),
                              const SizedBox(height: 10),
                              widget.userAddress != null &&
                                      widget.userAddress?.status !=
                                          StatusAddress.primary
                                  ? SubmitButtonWithIcon(
                                      width: AppSizes.phoneWidthMargin(context),
                                      color: lightGrey,
                                      isDark: true,
                                      text: 'Delete Address',
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      onTap: () => context
                                          .read<AddressCubit>()
                                          .deleteAddress(widget.userAddress!))
                                  : const SizedBox(),
                            ],
                          )
                        : const DefaultLoadingProgress(),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
