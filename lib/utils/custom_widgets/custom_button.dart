import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saral_app/home/bloc/app_cubit.dart';
import 'package:saral_app/home/page_tabs/page_tabs_map.dart';
import 'package:saral_app/utils/style/colors.dart';
import 'package:saral_app/utils/style/text_styles.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    Key? key,
    required this.index,
    required this.name,
  }) : super(key: key);
  final int index;
  final String name;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        return GestureDetector(
          onTap: () {
            cubit.onPageIconClicked(index);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: size.width * 0.12,
                  decoration: BoxDecoration(
                    color: cubit.state.pageIndex == index
                        ? AppColors.teal.withOpacity(0.18)
                        : AppColors.transparent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    pageTabMap[index]['icon'],
                    color: cubit.state.pageIndex == index
                        ? AppColors.teal
                        : AppColors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                name,
                style: AppTextStyles.bodyText12Black.copyWith(
                  color: cubit.state.pageIndex == index
                      ? AppColors.teal
                      : AppColors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
