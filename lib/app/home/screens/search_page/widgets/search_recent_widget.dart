import 'package:flutter/material.dart';

import '../../../../../config/constant.dart';
import '../../../../../config/theme.dart';
import '../../../models/search_recent.dart';
import 'search_recent_item.dart';

class SearchRecentWidget extends StatelessWidget {
  final List<SearchRecent> searchRecents;
  const SearchRecentWidget({
    Key? key,
    required this.searchRecents,
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
          Column(
            children: searchRecents
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SearchRecentItem(
                        searchRecent: e,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
