import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../config/theme.dart';

class SearchRecentItem extends StatelessWidget {
  final String title;
  const SearchRecentItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: mediumLightText,
        ),
        Icon(
          MdiIcons.close,
          color: secondaryColor,
        ),
      ],
    );
  }
}
