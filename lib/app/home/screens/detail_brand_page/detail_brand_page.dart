import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/models/product.dart';

import 'package:shoeping/shared/widgets/header_page.dart';
import 'package:shoeping/shared/widgets/product_box.dart';

import '../../../../shared/models/brand.dart';

class DetailBrandPage extends StatelessWidget {
  final Brand brand;
  const DetailBrandPage({
    Key? key,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderPage(
                brand.name,
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
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  List<Product> products = state.products!
                      .where((element) => element.brandId == brand.id)
                      .toList();
                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: products
                        .map((e) => InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, '/detail-product',
                                  arguments: e),
                              child: ProductBox(e),
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
