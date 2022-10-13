import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';

import '../../../../../config/constant.dart';
import '../../../../../shared/widgets/error_dialog.dart';
import 'brand_box.dart';

class BrandCategories extends StatefulWidget {
  const BrandCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<BrandCategories> createState() => _BrandCategoriesState();
}

class _BrandCategoriesState extends State<BrandCategories> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.brandStatus == BrandStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return state.brandStatus == BrandStatus.success
            ? SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.brands!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? AppSizes.defaultMargin : 0,
                          right: AppSizes.defaultMargin),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, RouteName.detailBrand,
                            arguments: state.brands![index]),
                        child: BrandBox(
                            text: state.brands![index].name,
                            image: imageAPIURL + state.brands![index].image),
                      ),
                    );
                  },
                ),
              )
            : const DefaultLoadingProgress();
      },
    );
  }
}
