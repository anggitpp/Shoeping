import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/app/wishlist/widgets/wishlist_product_box.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';
import 'package:shoeping/shared/widgets/error_dialog.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state.wishlistStatus == WishlistStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 1),
                  backgroundColor: mainColor,
                  margin: EdgeInsets.only(
                      bottom: AppSizes.phoneHeight(context) - 140,
                      left: AppSizes.defaultMargin,
                      right: AppSizes.defaultMargin),
                  content: Text(
                    'Produk berhasil dihapus dari Wishlist',
                    style: mediumText.copyWith(color: Colors.black),
                  ),
                ),
              );
            }

            if (state.wishlistStatus == WishlistStatus.error) {
              errorDialog(context, state.error);
            }
          },
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Your Wishlist', style: largeMediumText),
                          const Icon(Icons.shopping_cart_outlined,
                              color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return state.userStatus != UserStatus.loading
                              ? ListView.builder(
                                  itemCount: state.userModel!.wishlists!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: WishlistProductBox(
                                        product: state.userModel!
                                            .wishlists![index].product,
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
      ),
    );
  }
}
