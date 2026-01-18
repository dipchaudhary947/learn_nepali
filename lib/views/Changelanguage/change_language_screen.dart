import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:learn_nepali/providers/language_provider.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';
import 'package:learn_nepali/utils/helpers/app_text_styles.dart';
import 'package:learn_nepali/utils/helpers/img_icon_styles.dart';
import 'package:learn_nepali/views/BottomNav/bottom_nav.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

 void _showLanguagePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            // Drag handle
            Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            Text(
              AppLocalizations.of(context)!.selectLanguage,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 12),
            Divider(color: Colors.green.shade100),

            const _LanguageTile(name: "English", code: "en", flag: "🇺🇸"),
            const Divider(),
            const _LanguageTile(name: "नेपाली", code: "ne", flag: "🇳🇵"),
            const Divider(),
            const _LanguageTile(name: "ไทย", code: "th", flag: "🇹🇭"),

            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}


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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                AppTextStyles.titleTextStyle(
                  titleText: AppLocalizations.of(context)!.chooseLanguage,
                  size: 26,
                ),

                const SizedBox(height: 24),

                ImgIconStyles.homeUiImage(
                  iconImage: 'banner_logo.png',
                  size: 280,
                ),

                const SizedBox(height: 24),

                AppTextStyles.subTitleTextStyle(
                  titleText: AppLocalizations.of(context)!.languageTitle,
                  size: 22,
                ),

                const SizedBox(height: 12),

                AppTextStyles.descTextStyle(
                  titleText: AppLocalizations.of(context)!.languageSubtitle,
                  size: 16,
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => _showLanguagePicker(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: AppTextStyles.getStartedBtnTextStyle(
                      titleText: AppLocalizations.of(
                        context,
                      )!.selectLanguageButton,
                      size: 18,
                    ),
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

// Language Tile Widget
class _LanguageTile extends StatelessWidget {
  final String name;
  final String code;
  final String flag;

  const _LanguageTile({
    required this.name,
    required this.code,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    final selectedCode = context
        .watch<LanguageProvider>()
        .selectedLocale
        .languageCode;

    final bool isSelected = selectedCode == code;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () {
          context.read<LanguageProvider>().changeLanguage(code);

          Navigator.pop(context);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => BottomNav()),
            (route) => false,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  flag,
                  style: TextStyle(
                    fontSize: 26,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.black,
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
