import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/app/profile/cubit/profile_cubit.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';
import 'package:shoeping/shared/widgets/error_dialog.dart';
import 'package:shoeping/shared/widgets/header_page.dart';
import 'package:shoeping/shared/widgets/submit_button.dart';

import '../../../config/theme.dart';
import '../../../shared/widgets/default_text_field.dart';
import '../../../shared/widgets/form_validator.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.always;

  bool isVisible = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _submit() {
    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    context.read<ProfileCubit>().updateProfile(name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, profileState) {
        if (profileState.profileSubmitStatus == ProfileSubmitStatus.error) {
          errorDialog(context, profileState.error);
        }

        if (profileState.profileSubmitStatus == ProfileSubmitStatus.success) {
          //show snackbar with mainColor color and success message in top with black text color
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
                'Profile berhasil disimpan',
                style: mediumText.copyWith(color: Colors.black),
              ),
            ),
          );

          context.read<HomeCubit>().getUser();
        }
      },
      builder: (context, profileState) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            _nameController.text = _nameController.text.isEmpty
                ? state.userModel!.name
                : _nameController.text;
            _emailController.text = _emailController.text.isEmpty
                ? state.userModel!.email
                : _emailController.text;
            return Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultMargin, vertical: 20),
                    child: Column(
                      children: [
                        HeaderPage(
                          'Edit Profile',
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const InkWell(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: state.userModel!.photo.isEmpty
                                      ? const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/profile/me.png'),
                                          fit: BoxFit.cover,
                                        )
                                      : DecorationImage(
                                          image: NetworkImage(imageAPIURL +
                                              state.userModel!.photo)),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(1, 0.9),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: mainColor),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        DefaultTextField(
                          hintText: 'Type your email',
                          icon: Icons.email_outlined,
                          controller: _emailController,
                          isEnabled: false,
                        ),
                        DefaultTextField(
                          hintText: 'Type your name',
                          icon: Icons.person_outline,
                          controller: _nameController,
                          validator: (String? value) =>
                              FormValidator.validateText(value, 'Name',
                                  minLength: 2),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        profileState.profileSubmitStatus ==
                                ProfileSubmitStatus.submitting
                            ? const DefaultLoadingProgress()
                            : SubmitButton(
                                text: 'Simpan',
                                onTap: () => _submit(),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
