import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';
import 'package:shoeping/shared/widgets/product_box_with_border.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/shared/widgets/default_divider.dart';
import 'dart:async';

import '../../../../config/theme.dart';
import '../../cubit/home_cubit.dart';
import 'widgets/last_seen_widget.dart';
import 'widgets/search_recent_widget.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({Key? key}) : super(key: key);

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final TextEditingController searchController = TextEditingController();

  Timer? _debounce;
  String searchString = '';
  List<String> lastSeen = [];
  List<String> searchRecents = [];
  bool isLoading = false;

  _onSearchChanged(String query) {
    setState(() {
      isLoading = true;
    });
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        searchString = query;
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

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
                            onChanged: (value) => _onSearchChanged(value),
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
              searchString.isEmpty
                  ? Column(
                      children: [
                        lastSeen.isNotEmpty
                            ? const LastSeenWidget()
                            : const SizedBox(),
                        const SizedBox(height: 24),
                        lastSeen.isNotEmpty || searchRecents.isNotEmpty
                            ? const DefaultDivider()
                            : const SizedBox(),
                        const SizedBox(height: 24),
                        searchRecents.isNotEmpty
                            ? const SearchRecentWidget()
                            : const SizedBox(),
                      ],
                    )
                  : !isLoading
                      ? BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            var products = state.products!
                                .where((element) => element.name
                                    .toLowerCase()
                                    .contains(searchString.toLowerCase()))
                                .toList();

                            return Column(
                              children: [
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
                                            'Result for "$searchString"',
                                            style: largeText,
                                          ),
                                          Text(
                                            '${products.length} Found',
                                            style: largeText.copyWith(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: products.length,
                                        itemBuilder: (context, index) {
                                          return ProductBoxWithBorder(
                                            product: products[index],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : SizedBox(
                          height: AppSizes.phoneHeight(context) * 2 / 3,
                          child: const Center(child: DefaultLoadingProgress())),
            ],
          ),
        ),
      ),
    );
  }
}
