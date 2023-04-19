import 'package:flutter/material.dart';
import 'package:saral_app/utils/custom_widgets/analysis_card.dart';
import 'package:saral_app/utils/style/colors.dart';
import 'package:saral_app/utils/style/images.dart';
import 'package:saral_app/utils/style/text_styles.dart';

class Analysis extends StatelessWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025,
          vertical: MediaQuery.of(context).size.height * 0.015,
        ),
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your cycle history,at a\nglance\n',
                        style: AppTextStyles.bodyText24BlackBold,
                      ),
                      TextSpan(
                        text: '\nLook back at your past cycle to identify\n'
                            'pattern in your body.',
                        style: AppTextStyles.bodyTextBlack,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.099,
                  child: const Image(
                    image: AssetImage(
                      AppImages.search,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AnalysisCard(
                  text: 'Cycle length',
                  trackColor: AppColors.teal,
                  progressValue: 100,
                ),
                AnalysisCard(
                  text: 'Cycle variation',
                  trackColor: AppColors.teal,
                  progressValue: 0,
                ),
                AnalysisCard(
                  text: 'Period length',
                  trackColor: AppColors.teal,
                  progressValue: 20,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: AppColors.teal.withOpacity(0.3),
                radius: MediaQuery.of(context).size.width * 0.14,
                backgroundImage: const AssetImage(
                  'assets/images/newNote.png',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              'No cycle history yet',
              style: AppTextStyles.bodyText18BlackBold,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              'Track your period to start getting insights.',
              style: AppTextStyles.bodyTextBlack,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.32,
                decoration: BoxDecoration(
                  color: AppColors.teal,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Tap to track',
                        style: AppTextStyles.bodyTextTwo,
                      ),
                      Icon(
                        Icons.add,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
