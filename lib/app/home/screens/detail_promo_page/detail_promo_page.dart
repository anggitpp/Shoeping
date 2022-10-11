import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/default_divider.dart';
import 'package:shoeping/shared/widgets/header_page.dart';
import 'package:shoeping/shared/widgets/submit_button_with_icon.dart';

import '../../../../config/constant.dart';
import '../../models/promo.dart';

class DetailPromoPage extends StatelessWidget {
  final Promo promo;
  const DetailPromoPage({
    Key? key,
    required this.promo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderPage(
                  'Detail Promo',
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 180,
                  width: AppSizes.phoneWidthMargin(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageAPIURL + promo.image),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  promo.name,
                  style: largeMediumText.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const DefaultDivider(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  promo.description,
                  style: mediumMediumText.copyWith(color: Colors.white),
                )
              ],
            ),
            Positioned(
              bottom: AppSizes.defaultMargin,
              child: SubmitButtonWithIcon(
                width: AppSizes.phoneWidthMargin(context),
                color: mainColor,
                text: 'Salin Kode Kupon',
                icon: const Icon(Icons.copy, color: Colors.black),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: promo.code)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Kode promo berhasil disalin')));
                  });
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
