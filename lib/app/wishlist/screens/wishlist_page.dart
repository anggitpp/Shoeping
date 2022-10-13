import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/app/wishlist/widgets/wishlist_product_box.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: AppSizes.phoneWidthMargin(context) -
                              16 -
                              AppSizes.defaultMargin,
                          height: 48,
                          child: TextField(
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
                        const SizedBox(
                          width: 16,
                        ),
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
                    const SizedBox(height: 27),
                    Text('Your Wishlist Product', style: largeMediumText),
                    const SizedBox(height: 16),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return state.userStatus != UserStatus.loading
                            ? ListView.builder(
                                itemCount: state.userModel!.wishlists!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: WishlistProductBox(
                                      product: state
                                          .userModel!.wishlists![index].product,
                                    ),
                                  );
                                })
                            : const DefaultLoadingProgress();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
