import 'package:flutter/material.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 327,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/promo/promo-1.png'),
        ),
      ),
    );
  }
}
