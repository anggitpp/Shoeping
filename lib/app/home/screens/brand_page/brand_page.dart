import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/widgets/header_page.dart';
import 'package:shoeping/shared/widgets/product_box.dart';

import '../../../../config/theme.dart';
import '../../../../shared/models/product.dart';
import '../../cubit/home_cubit.dart';

class BrandPage extends StatelessWidget {
  const BrandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultMargin),
              child: HeaderPage(
                'List Brand',
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
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.brands!.length,
                  itemBuilder: (context, index) {
                    List<Product> productByBrand = state.products!
                        .where((element) =>
                            element.brandId == state.brands![index].id)
                        .toList();
                    return Column(
                      children: [
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const SizedBox(width: AppSizes.defaultMargin),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageAPIURL +
                                          state.brands![index].image),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                              alignment: Alignment.center,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              state.brands![index].name,
                              style: largeMediumText,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 230,
                          child: ListView.builder(
                              itemCount: productByBrand.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: index == 0
                                          ? AppSizes.defaultMargin
                                          : 0,
                                      right: AppSizes.defaultMargin),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: borderColor, width: 1),
                                  ),
                                  child: ProductBox(
                                    productByBrand[index],
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
