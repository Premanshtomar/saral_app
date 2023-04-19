// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saral_app/utils/values/routes.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  PageController pageController = PageController(
    initialPage: 2,
  );

  void onPageIconClicked(index) {
    pageController.animateToPage(
      index,
      duration: const Duration(microseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(index) {
    onPageIconClicked(index);
    emit(state.copyWith(pageIndex: index));
  }

  void onLogoutClicked(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.signIn,
      (route) => false,
    );
  }
}
