import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoeping/app/home/screens/search_page/widgets/search_product_box.dart';
import 'package:shoeping/config/constant.dart';
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
              SizedBox(
                height: 12,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
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
                        SizedBox(width: 16),
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.defaultMargin),
                          child: Column(
                            children: [
                              SizedBox(height: 36),
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
                              SizedBox(height: 16),
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
                                  child: ProductBox(),
                                );
                              }),
                        ),
                        SizedBox(height: 24),
                        DefaultDivider(),
                        SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.symmetric(
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
                              SizedBox(height: 20),
                              SearchRecentItem(title: 'Sepatu Kuda'),
                              SizedBox(height: 8),
                              SearchRecentItem(title: 'Nike Jordan'),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
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
                        SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.symmetric(
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
                                        SizedBox(height: 24),
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
                                  : SizedBox(),
                              SizedBox(height: 24),
                              SearchProductBox(),
                              SizedBox(height: 12),
                              SearchProductBox(),
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
