import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saral_app/home/bloc/app_cubit.dart';
import 'package:saral_app/home/page_tabs/page_tabs_map.dart';
import 'package:saral_app/utils/style/text_styles.dart';

class NothingPage extends StatelessWidget {
  const NothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      var cubit = context.read<AppCubit>();
      return Scaffold(
        extendBody: false,
        body: Container(
          color: pageTabMap[state.pageIndex]['color'],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal:16,vertical: 100),
          child: Center(
            child:Text(
              pageTabMap[cubit.state.pageIndex]['title'],
              style: AppTextStyles.bodyText24BlackBold,
            ),
          ),
        ),
      );
    });
  }
}
