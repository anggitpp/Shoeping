import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/config/theme.dart';

import '../../../../shared/widgets/product_box.dart';
import 'widgets/brand_box.dart';
import 'widgets/promo_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    final List<String> brands = ['Adidas', 'Puma', 'Nike', 'Reebok'];
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
                        Text(
                          'See All',
                          style: mediumLightText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? AppSizes.defaultMargin : 0,
                          right: AppSizes.defaultMargin),
                      child: const PromoBox(),
                    );
                  },
                ),
              ),
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
                    Text(
                      'See All',
                      style: mediumLightText,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? AppSizes.defaultMargin : 0,
                          right: AppSizes.defaultMargin),
                      child: BrandBox(
                          text: brands[index],
                          image:
                              'assets/images/brand/${brands[index].toLowerCase()}.png'),
                    );
                  },
                ),
              ),
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
                        Text(
                          'See All',
                          style: mediumLightText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: List.generate(
                        4,
                        (index) => GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, RouteName.detailProduct),
                            child: const ProductBox()),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
