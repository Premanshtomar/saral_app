import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saral_app/home/page_tabs/page_screens/analysis.dart';
import 'package:saral_app/home/page_tabs/page_screens/content.dart';
import 'package:saral_app/home/page_tabs/page_screens/nothing.dart';
import 'package:saral_app/utils/style/colors.dart';

final List<Map<String, dynamic>> pageTabMap = [
  {
    'pageName': const NothingPage(),
    'title': 'Cycle',
    'icon': Icons.calendar_month_outlined,
    'color': AppColors.amberAccent
  },
  {
    'pageName': const NothingPage(),
    'title': 'Calendar',
    'icon': Icons.calendar_month_outlined,
    'color': AppColors.redAccent
  },
  {
    'pageName': const NothingPage(),
    'title': 'New Track',
    'icon': Icons.calendar_month_outlined,
    'color': AppColors.teal
  },
  {
    'pageName': const Analysis(),
    'title': 'Analysis',
    'icon': Icons.task,
  },
  {
    'pageName': const ContentPage(),
    'title': 'Content',
    'icon': CupertinoIcons.book
  },
];
