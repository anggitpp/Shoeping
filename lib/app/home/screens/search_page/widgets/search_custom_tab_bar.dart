import 'package:flutter/material.dart';

import '../../../../../config/constant.dart';
import '../../../../../config/theme.dart';

class SearchCustomTabBar extends StatelessWidget {
  final String text;
  final bool isSelected;
  const SearchCustomTabBar(
    this.text,
    this.isSelected, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      width: AppSizes.phoneWidth(context) / 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 2, color: isSelected ? mainColor : Colors.white))),
      child: Text(
        text,
        style: largeMediumText.copyWith(
            color: isSelected ? mainColor : Colors.white),
      ),
    );
  }
}
