import 'package:flutter/material.dart';
import 'package:saral_app/utils/style/colors.dart';
import 'package:saral_app/utils/style/text_styles.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String imageStr;

  const ContentCard({
    super.key,
    required this.imageStr,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 06,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: AssetImage(imageStr),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.6),
            // borderRadius: BorderRadius.circular(15),
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  title,
                  style: AppTextStyles.bodyText18BlackBold,
                ),
              )),
        ),
      ),
    );
  }
}
