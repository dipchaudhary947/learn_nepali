import 'package:flutter/material.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';

class AppTextStyles {
  // Home TitleTextStyle UI
  static Widget titleTextStyle({
    required String titleText,
    required double size,
  }) {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: size,
        color: AppColors.white,
        fontWeight: .bold,
        letterSpacing: 1
      ),
      textAlign: .center,
    );
  }

  // Home SubTitleTextStyle UI
  static Widget subTitleTextStyle({
    required String titleText,
    required double size,
  }) {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: size,
        color: AppColors.black,
        fontWeight: .bold,
        letterSpacing: 1
      ),
      textAlign: .center,
    );
  }
  
  // Home DescriptionsTextStyle UI
  static Widget descTextStyle({
    required String titleText,
    required double size,
  }) {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: size,
        color: AppColors.textDark,
        fontWeight: .normal,
        letterSpacing: 1
      ),
      textAlign: .center,
    );
  }

  // Home ButtonTextStyle UI
  static Widget getStartedBtnTextStyle({
    required String titleText,
    required double size,
  }) {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        letterSpacing: 1
      ),
      textAlign: .center,
    );
  }
}
