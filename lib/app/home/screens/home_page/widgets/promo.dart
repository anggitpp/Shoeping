import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/app/home/screens/home_page/widgets/promo_box.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';

import '../../../../../config/constant.dart';
import '../../../../../shared/widgets/error_dialog.dart';

class HomePromoWidget extends StatefulWidget {
  const HomePromoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePromoWidget> createState() => _HomePromoWidgetState();
}

class _HomePromoWidgetState extends State<HomePromoWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.productStatus == ProductStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return state.promoStatus == PromoStatus.success
            ? SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: state.promos!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? AppSizes.defaultMargin : 0,
                          right: AppSizes.defaultMargin),
                      child: PromoBox(state.promos![index]),
                    );
                  },
                ),
              )
            : const DefaultLoadingProgress();
      },
    );
  }
}
