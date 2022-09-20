import 'package:flutter/material.dart';
import 'package:shoeping/app/home/screens/search_page/widgets/search_product_box.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/shared/widgets/default_divider.dart';
import 'package:shoeping/shared/widgets/product_box.dart';

import '../../../../config/theme.dart';
import 'widgets/search_custom_tab_bar.dart';
import 'widgets/search_recent_item.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({Key? key}) : super(key: key);

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final TextEditingController searchController = TextEditingController();

  String searchString = '';
  String selectedTab = 'Product';
  List<String> tabs = ['Product', 'Store'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: AppSizes.phoneWidthMargin(context) -
                              60 -
                              AppSizes.defaultMargin,
                          height: 48,
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                searchString = value;
                              });
                            },
                            style: mediumText.copyWith(color: Colors.white),
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
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, RouteName.cart),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              searchString.isNotEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.defaultMargin),
                          child: Column(
                            children: [
                              const SizedBox(height: 36),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 210,
                          child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0
                                          ? AppSizes.defaultMargin
                                          : 16,
                                      right: index == 9
                                          ? AppSizes.defaultMargin
                                          : 0),
                                  child: const ProductBox(),
                                );
                              }),
                        ),
                        const SizedBox(height: 24),
                        const DefaultDivider(),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.defaultMargin),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Search Recent',
                                    style: largeMediumText,
                                  ),
                                  Text(
                                    'Clear All',
                                    style: mediumText.copyWith(color: redColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const SearchRecentItem(title: 'Sepatu Kuda'),
                              const SizedBox(height: 8),
                              const SearchRecentItem(title: 'Nike Jordan'),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                            children: tabs
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedTab = e;
                                      });
                                    },
                                    child: SearchCustomTabBar(
                                        e, e == selectedTab ? true : false),
                                  ),
                                )
                                .toList()),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.defaultMargin),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Result for "Metcon"',
                                    style: largeText,
                                  ),
                                  Text(
                                    '2 Found',
                                    style:
                                        largeText.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                              selectedTab == 'Store'
                                  ? Column(
                                      children: [
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/store/adidas.png'),
                                                      fit: BoxFit.cover),
                                                  shape: BoxShape.circle),
                                              alignment: Alignment.center,
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              'Nike Official Store',
                                              style: largeMediumText,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              const SizedBox(height: 24),
                              const SearchProductBox(),
                              const SizedBox(height: 12),
                              const SearchProductBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
