import 'package:flutter/material.dart';

import 'package:shoeping/app/authentication/models/user_address.dart';

import '../../../../config/constant.dart';
import '../../../../config/theme.dart';

class MyAddressBox extends StatelessWidget {
  final UserAddress address;
  const MyAddressBox(
    this.address, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.phoneWidthMargin(context),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: lighterBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                address.title,
                style: largeMediumText,
              ),
              SizedBox(
                width: 6,
              ),
              address.status == StatusAddress.primary
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: mainColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'Default',
                        style: mediumMediumText.copyWith(color: mainColor),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                address.name,
                style: mediumMediumText.copyWith(color: Colors.white),
              ),
              Text(
                ' | ',
                style: mediumMediumText.copyWith(color: Colors.white),
              ),
              Text(
                address.phoneNumber,
                style: mediumMediumText.copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            address.address,
            style: mediumMediumText,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            address.subtitle,
            style: mediumMediumText,
          ),
        ],
      ),
    );
  }
}
