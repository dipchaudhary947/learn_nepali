import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (!Platform.isAndroid) {
      throw UnsupportedError("AdMob is supported only on Android");
    }

    // Android Banner Test Ad Unit ID
    return "ca-app-pub-3940256099942544/6300978111";
  }
}
