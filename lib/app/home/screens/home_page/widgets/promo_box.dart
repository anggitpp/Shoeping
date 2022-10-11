import 'package:flutter/material.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';

import '../../../models/promo.dart';

class PromoBox extends StatelessWidget {
  final Promo promo;
  const PromoBox(
    this.promo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteName.detailPromo,
        arguments: promo,
      ),
      child: Container(
        height: 180,
        width: 327,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageAPIURL + promo.image),
          ),
        ),
      ),
    );
  }
}
