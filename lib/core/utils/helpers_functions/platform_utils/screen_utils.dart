import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:flutter/services.dart';

// تفعيل الوضع العادي للشاشة (خروج من ملء الشاشة)
// - في Android: عرض الأشرطة العلوية والسفلية.
// - في Windows: الخروج من وضع ملء الشاشة.
Future<void> setNormalScreenMode() async {
  await setSystemUIVisibility(true);
  await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
}

// تفعيل وضع ملء الشاشة.
// - في Android: إخفاء الساعة والأزرار، وتدوير الشاشة أفقيًا.
// - في Windows: تكبير النافذة لتملأ الشاشة.
Future<void> setFullScreenMode() async {
  // immersive => اخفاء الادوات الساعة والبطارية من اعلى الشاشة وازرار الرجوع من الاسفل
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

Future<void> setSystemUIVisibility(bool isVisible) async {
  await SystemChrome.setEnabledSystemUIMode(
    isVisible ? SystemUiMode.edgeToEdge : SystemUiMode.immersiveSticky,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: DarkColors.appBar, // مهم مع edgeToEdge
      statusBarIconBrightness: Brightness.light, // للأندرويد
      statusBarBrightness: Brightness.light,
    ),
  );
}
