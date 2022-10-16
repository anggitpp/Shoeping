import 'package:flutter/material.dart';

import '../../../../../config/constant.dart';
import '../../../../../config/theme.dart';

class LastSeenWidget extends StatelessWidget {
  const LastSeenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
      child: Column(
        children: [
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last Seen',
                style: largeMediumText,
              ),
              Text(
                'Clear All',
                style: mediumText.copyWith(color: redColor),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 210,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? AppSizes.defaultMargin : 16,
                        right: index == 9 ? AppSizes.defaultMargin : 0),
                    // child: const ProductBox(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
