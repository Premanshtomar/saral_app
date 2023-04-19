import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saral_app/home/bloc/app_cubit.dart';
import 'package:saral_app/home/page_tabs/page_tabs_map.dart';
import 'package:saral_app/utils/custom_widgets/custom_button.dart';
import 'package:saral_app/utils/style/colors.dart';
import 'package:saral_app/utils/style/text_styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        var size = MediaQuery.of(context).size;
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Center(
              child: Text(pageTabMap[state.pageIndex]['title']),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.teal,
            onPressed: () {
              cubit.onLogoutClicked(context);
            },
            child: const Icon(
              Icons.logout,
              color: AppColors.white,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 10,
            child: SizedBox(
              height: size.height * 0.08,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BottomBarButton(
                    index: 0,
                    name: 'Cycle',
                  ),
                  const BottomBarButton(
                    index: 1,
                    name: 'Calendar',
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.onPageIconClicked(2);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.04,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                              color: AppColors.teal,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(18)),
                          child: const Icon(
                            Icons.add,
                            size: 35,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text("Track",
                            style: AppTextStyles.bodyText12Black),
                      ],
                    ),
                  ),
                  const BottomBarButton(
                    index: 3,
                    name: 'Analysis',
                  ),
                  const BottomBarButton(
                    index: 4,
                    name: 'Content',
                  ),
                ],
              ),
            ),
          ),
          body: PageView(
            controller: cubit.pageController,
            onPageChanged: (index) {
              cubit.onPageChanged(index);
            },
            children: [
              pageTabMap[0]['pageName'],
              pageTabMap[1]['pageName'],
              pageTabMap[2]['pageName'],
              pageTabMap[3]['pageName'],
              pageTabMap[4]['pageName'],
            ],
          ),
        );
      },
    );
  }
}
