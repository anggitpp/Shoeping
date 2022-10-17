import 'package:flutter/material.dart';

import '../../../../../config/constant.dart';
import '../../../../../config/theme.dart';
import 'search_recent_item.dart';

class SearchRecentWidget extends StatelessWidget {
  const SearchRecentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search Recent',
                style: largeMediumText,
              ),
              Text(
                'Clear All',
                style: mediumText.copyWith(color: redColor),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SearchRecentItem(title: 'Sepatu Kuda'),
          const SizedBox(height: 8),
          const SearchRecentItem(title: 'Nike Jordan'),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
