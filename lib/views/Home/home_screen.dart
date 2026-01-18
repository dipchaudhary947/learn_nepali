import 'package:flutter/material.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';
import 'package:learn_nepali/utils/helpers/app_text_styles.dart';
import 'package:learn_nepali/utils/helpers/img_icon_styles.dart';
import 'package:learn_nepali/views/BottomNav/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4CAF50), Color(0xFFE8F5E9)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                AppTextStyles.titleTextStyle(
                  titleText: AppLocalizations.of(context)!.appWelcomeTitle,
                  size: 24,
                ),
                const SizedBox(height: 20),
                // Image
                ImgIconStyles.homeUiImage(
                  iconImage: 'banner_logo.png', 
                  size: 300, 
                ),
                const SizedBox(height: 20),
                // SubTitle
                AppTextStyles.subTitleTextStyle(
                  titleText: AppLocalizations.of(context)!.appTitle,
                  size: 24,
                ),
                const SizedBox(height: 20),

                // Description
                AppTextStyles.descTextStyle(
                  titleText:
                     AppLocalizations.of(context)!.appDescription,
                  size: 16,
                ),
                const Spacer(),
                // Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNav()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      elevation: 8,
                      shadowColor: AppColors.textDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      
                    ),
                    child: AppTextStyles.getStartedBtnTextStyle(
                      titleText: AppLocalizations.of(context)!.startLearnBtn, size: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
