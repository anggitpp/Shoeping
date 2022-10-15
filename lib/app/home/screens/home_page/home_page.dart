import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/config/theme.dart';

import '../../cubit/home_cubit.dart';
import 'widgets/brand_categories.dart';
import 'widgets/most_popular.dart';
import 'widgets/promo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeCubit>().getUser();
    context.read<HomeCubit>().getPromos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                width: AppSizes.phoneWidth(context),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: AppSizes.phoneWidthMargin(context) -
                              16 -
                              AppSizes.defaultMargin,
                          height: 48,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, RouteName.homeSearch),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                fillColor: lighterBlack,
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: secondaryColor,
                                ),
                                hintText: 'Search any product',
                                hintStyle: mediumText,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, RouteName.cart),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Special Offers',
                          style: largeText.copyWith(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, RouteName.promo),
                          child: Text(
                            'See All',
                            style: mediumLightText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomePromoWidget(),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Brand Categories',
                      style: largeText.copyWith(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RouteName.brand),
                      child: Text(
                        'See All',
                        style: mediumLightText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const BrandCategories(),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Populars',
                          style: largeText.copyWith(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, RouteName.product),
                          child: Text(
                            'See All',
                            style: mediumLightText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const HomeMostPopularWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
