import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';

import '../../../../../config/route_name.dart';
import '../../../../../shared/widgets/error_dialog.dart';
import '../../../../../shared/widgets/product_box.dart';
import '../../../cubit/home_cubit.dart';

class HomeMostPopularWidget extends StatefulWidget {
  const HomeMostPopularWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeMostPopularWidget> createState() => _HomeMostPopularWidgetState();
}

class _HomeMostPopularWidgetState extends State<HomeMostPopularWidget> {
  @override
  void initState() {
    context.read<HomeCubit>().getProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.productStatus == ProductStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return state.productStatus == ProductStatus.success
            ? Wrap(
                spacing: 20,
                runSpacing: 20,
                children: List.generate(
                  state.products!.length,
                  (index) => GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RouteName.detailProduct),
                      child: ProductBox(state.products![index])),
                ),
              )
            : const DefaultLoadingProgress();
      },
    );
  }
}
