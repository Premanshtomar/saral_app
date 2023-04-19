import 'package:flutter/material.dart';
import 'package:saral_app/utils/style/colors.dart';
import 'package:saral_app/utils/style/text_styles.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class AnalysisCard extends StatelessWidget {
  const AnalysisCard({
    Key? key,
    required this.text,
    required this.trackColor,
    required this.progressValue,
  }) : super(key: key);

  // final BuildContext context;
  final String text;
  final Color trackColor;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6),
      ),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              text,
              style: AppTextStyles.bodyTextBlack,
            ),
          ),
          SleekCircularSlider(
            innerWidget: (_) => Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '__',
                    style: AppTextStyles.bodyText18BlackBold,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('day')
                ],
              ),
            ),
            appearance: CircularSliderAppearance(
              customColors: CustomSliderColors(
                trackColor: AppColors.cremeColor,
                shadowColor: AppColors.transparent,
                shadowMaxOpacity: 0,
                progressBarColor:
                    progressValue == 0 ? AppColors.transparent : trackColor,
              ),
              customWidths: CustomSliderWidths(
                progressBarWidth: 10,
                trackWidth: 10,
                handlerSize: 0,
              ),
              size: 140,
              startAngle: 270,
              angleRange: 310,
            ),
            min: 0,
            max: 100,
            initialValue: progressValue,
          ),
        ],
      ),
    );
  }
}
