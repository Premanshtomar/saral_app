import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saral_app/authentication/bloc/auth_cubit.dart';
import 'package:saral_app/authentication/screens/sign_in.dart';
import 'package:saral_app/home/bloc/app_cubit.dart';
import 'package:saral_app/home/screen/home.dart';
import 'package:saral_app/utils/style/colors.dart';
import 'package:saral_app/utils/values/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.home: (context) => const Home(),
          AppRoutes.signIn: (context) => const GoogleSignInScreen(),
        },
        title: 'Saral App',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          primaryColor: AppColors.white,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: AppColors.black,
            ),
            color: AppColors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            titleTextStyle: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        home: FirebaseAuth.instance.currentUser != null
            ? const Home()
            : const GoogleSignInScreen(),
      ),
    );
  }
}
