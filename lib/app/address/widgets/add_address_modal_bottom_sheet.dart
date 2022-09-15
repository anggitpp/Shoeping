import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';
import '../../../shared/widgets/default_divider.dart';
import '../../../shared/widgets/submit_button_with_icon.dart';

class AddAddressModalBottomSheet extends StatelessWidget {
  const AddAddressModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 415,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.defaultMargin),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: 26,
            height: 2,
            decoration: BoxDecoration(
                color: borderColor, borderRadius: BorderRadius.circular(3)),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rumah Anggit',
                      style: extraLargeTitleText.copyWith(color: Colors.white),
                    ),
                    const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Bekasi, Jawa Barat',
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
                  'Contact',
                  style: mediumText.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  style: mediumText.copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: secondaryColor,
                    ),
                    hintText: 'Phone Number',
                    hintStyle: mediumLightText,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  style: mediumText.copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      MdiIcons.mapMarker,
                      color: secondaryColor,
                    ),
                    hintText: 'Detail Location',
                    hintStyle: mediumLightText,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const DefaultDivider(),
                const SizedBox(
                  height: 24,
                ),
                SubmitButtonWithIcon(
                  width: AppSizes.phoneWidthMargin(context),
                  color: mainColor,
                  text: 'Add New Address',
                  icon: Icon(
                    Icons.add,
                    color: lighterBlack,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
