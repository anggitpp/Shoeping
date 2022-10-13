import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/home/screens/home_page/widgets/promo_box.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/widgets/header_page.dart';

import '../../cubit/home_cubit.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
          child: Column(
            children: [
              const SizedBox(height: 10),
              HeaderPage(
                'Data Promo',
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.promos?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: PromoBox(state.promos![index]));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
