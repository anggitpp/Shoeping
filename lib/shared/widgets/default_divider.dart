import 'package:flutter/material.dart';

import '../../config/constant.dart';
import '../../config/theme.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.phoneWidthMargin(context),
      height: 1,
      color: darkGreyColor,
    );
  }
}
