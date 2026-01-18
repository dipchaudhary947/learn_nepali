import 'package:flutter/material.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  cardColor: AppColors.cardBackground,
  
  textTheme: TextTheme(
    displayLarge: TextStyle(color: AppColors.textDark, fontSize: 24, fontWeight: FontWeight.bold),  
    bodyLarge: TextStyle(color: AppColors.textPrimary), 
    bodyMedium: TextStyle(color: AppColors.textSecondary), 
  ),
  
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primary,
  ),
);
