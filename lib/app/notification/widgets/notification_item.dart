import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.defaultMargin, bottom: 16),
      child: Slidable(
        useTextDirection: false,
        endActionPane: ActionPane(
            extentRatio: 0.15,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {},
                backgroundColor: redColor,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
              ),
            ]),
        child: Container(
          margin:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
          width: AppSizes.phoneWidthMargin(context),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: lighterBlack,
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: mainColor.withOpacity(0.1)),
                child: Icon(MdiIcons.brightnessPercent, color: mainColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('90% Special Discount!', style: largeMediumText),
                  const SizedBox(height: 6),
                  Text('Special promotion only new account', style: smallText),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
