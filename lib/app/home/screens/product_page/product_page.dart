import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/widgets/header_page.dart';

import '../../../../config/route_name.dart';
import '../../../../shared/models/product.dart';
import '../../../../shared/widgets/product_box.dart';
import '../../cubit/home_cubit.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
          child: Column(
            children: [
              SizedBox(height: 10),
              HeaderPage(
                'Semua Produk',
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: state.products!
                        .map((e) => InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, RouteName.detailProduct,
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
