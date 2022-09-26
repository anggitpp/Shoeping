import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/authentication/cubits/login/login_cubit.dart';
import 'package:shoeping/app/authentication/cubits/registration/registration_cubit.dart';
import '../config/routes.dart';
import '../config/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/authentication/repositories/auth_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: backgroundColor, // Color for Android
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness:
              Brightness.dark // Dark == white status bar -- for IOS.
          ),
    );
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
              firebaseFirestore: FirebaseFirestore.instance,
              firebaseAuth: FirebaseAuth.instance),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RegistrationCubit>(
            create: (context) => RegistrationCubit(
                authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) =>
                LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shoeping',
          theme: darkTheme,
          routes: routes,
        ),
      ),
    );
  }
}
