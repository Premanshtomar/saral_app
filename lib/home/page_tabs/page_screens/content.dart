import 'package:flutter/material.dart';
import 'package:saral_app/utils/custom_widgets/content_card.dart';
import 'package:saral_app/utils/style/images.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        ContentCard(
          title: 'Fertility',
          imageStr: AppImages.fertility,
        ),
        ContentCard(
          title: 'Sex',
          imageStr: AppImages.sex,
        ),
        ContentCard(
          title: 'Mensuration',
          imageStr: AppImages.mensuration,
        ),
      ],
    ));
  }
}
