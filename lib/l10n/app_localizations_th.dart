// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appWelcomeTitle => 'สวัสดี 🙏 เรียนภาษาเนปาลี...!';

  @override
  String get appTitle => 'ตัวเลข สระ พยัญชนะ และวลี';

  @override
  String get appDescription => 'เรียนรู้พื้นฐานภาษาเนปาลีด้วยบทเรียนง่าย ๆ เกี่ยวกับตัวเลข ตัวอักษร และวลี เหมาะสำหรับผู้เริ่มต้นที่ต้องการเรียนรู้อย่างรวดเร็ว!';

  @override
  String get startLearnBtn => 'เริ่มเรียนภาษาเนปาลี';

  @override
  String get numbers => 'ตัวเลข';

  @override
  String get nepaliNumbers => 'ตัวเลขภาษาเนปาลี';

  @override
  String get consonants => 'พยัญชนะ';

  @override
  String get nepaliConsonants => 'พยัญชนะภาษาเนปาลี';

  @override
  String get vowels => 'สระ';

  @override
  String get nepaliVowels => 'สระภาษาเนปาลี';

  @override
  String get phrases => 'วลี';

  @override
  String get nepaliPhrases => 'วลีภาษาเนปาลี';

  @override
  String get noCategorySelected => 'ยังไม่ได้เลือกหมวดหมู่';

  @override
  String get pronunciation => 'การออกเสียง:';

  @override
  String get meaning => 'ความหมาย:';

  @override
  String get thaiMeaning => 'ความหมายภาษาไทย:';

  @override
  String get removedFromFavorites => 'ลบออกจากรายการโปรดแล้ว ❌';

  @override
  String get addedToFavorites => 'เพิ่มในรายการโปรดแล้ว ⭐';

  @override
  String get search => 'ค้นหา';

  @override
  String get searchHintText => 'ค้นหาภาษาเนปาลี...';

  @override
  String searchNotFound(Object query) {
    return 'ไม่พบผลลัพธ์สำหรับ \'$query\'';
  }

  @override
  String get favorites => 'รายการโปรด';

  @override
  String get noFavorites => 'ยังไม่มีรายการโปรด';

  @override
  String get chooseLanguage => 'เลือกภาษา 🌏';

  @override
  String get languageTitle => 'อังกฤษ • เนปาลี • ไทย';

  @override
  String get languageSubtitle => 'เลือกภาษาที่ต้องการสำหรับความหมายและคำแปลขณะเรียนภาษาเนปาลี';

  @override
  String get selectLanguageButton => 'เลือกภาษา';

  @override
  String get selectLanguage => 'เลือกภาษา';
}
