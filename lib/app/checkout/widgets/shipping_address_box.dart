import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class ShippingAddressBox extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final bool isDefault;
  final bool isSelected;
  const ShippingAddressBox({
    Key? key,
    required this.name,
    required this.phone,
    required this.address,
    this.isDefault = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 200,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? mainColor : Colors.transparent),
        borderRadius: BorderRadius.circular(6),
        color: lighterBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: mediumMediumText.copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 8,
              ),
              isDefault
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: mainColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'Default',
                        style: smallText.copyWith(color: mainColor),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            phone,
            style: mediumMediumText.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 70,
            child: Text(
              address,
              style: smallText,
              maxLines: 3,
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}
