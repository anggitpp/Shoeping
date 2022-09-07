import 'package:flutter/material.dart';
import 'package:shoeping/app/checkout/widgets/shipping_address_box.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';
import '../../../widgets/submit_button_with_icon.dart';

class ChooseAddressModalBottomSheet extends StatelessWidget {
  const ChooseAddressModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      padding: EdgeInsets.symmetric(vertical: AppSizes.defaultMargin),
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
          SizedBox(
            height: 16,
          ),
          Text(
            'Shipping Address',
            style: extraLargeTitleText.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? AppSizes.defaultMargin : 0,
                      right: AppSizes.defaultMargin),
                  child: ShippingAddressBox(
                    name: 'Rumah Anggit',
                    phone: '08515510987',
                    address:
                        'Jalan Bintara VIII RT 5 RW 3 Gang Kutilang no 42, Bekasi Barat',
                    isSelected: index == 0 ? true : false,
                    isDefault: index == 0 ? true : false,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          SubmitButtonWithIcon(
            width: AppSizes.phoneWidthMargin(context),
            color: lighterBlack,
            text: 'Add Address',
            icon: Icon(Icons.add),
            isDark: true,
          ),
        ],
      ),
    );
  }
}
