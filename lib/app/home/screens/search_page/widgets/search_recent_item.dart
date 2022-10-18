import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shoeping/app/home/models/search_recent.dart';

import '../../../../../config/theme.dart';
import '../../../cubit/home_cubit.dart';

class SearchRecentItem extends StatelessWidget {
  final SearchRecent searchRecent;
  const SearchRecentItem({
    Key? key,
    required this.searchRecent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          searchRecent.keyword,
          style: mediumLightText,
        ),
        GestureDetector(
          onTap: () => context.read<HomeCubit>().deleteSearch(searchRecent),
          child: Icon(
            MdiIcons.close,
            color: secondaryColor,
          ),
        ),
      ],
    );
  }
}
