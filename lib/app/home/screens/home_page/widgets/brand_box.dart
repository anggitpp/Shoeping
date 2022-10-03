import 'package:flutter/material.dart';

import '../../../../../config/theme.dart';

class BrandBox extends StatelessWidget {
  final String text;
  final String image;
  const BrandBox({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: lighterBlack,
          ),
          alignment: Alignment.center,
          child: Image.network(
            image,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          text,
          style: mediumText.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
