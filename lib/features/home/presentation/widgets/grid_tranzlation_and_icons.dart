import 'package:cupcat/core/constants/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
//Translation
class GridItemTranslation {
  static List<String> itemNames = [
    "photo_edit".tr(),
    "text_to_image".tr(),
    "autoCut".tr(),
    "prodect_photo".tr(),
    "collapse".tr(),
    "ai_poster".tr(),
    "ai_model".tr(),
    "camera".tr(),
    "retouch".tr(),
    "auto_captions".tr(),
    "teleprompter".tr(),
    "remove_background".tr(),
    "image_enhancement".tr(),
  ];

  static List<String> translatedStrings =
      itemNames.map((string) => tr(string)).toList();

  static List<String> itemIcons = [
    AppAssets.homePageIconEdit,
    AppAssets.homePageIconImage,
    AppAssets.homePageAutoCut,
    AppAssets.homePageProductPhoto,
    AppAssets.homePageCollapse,
    AppAssets.homePageAiPoster,
    AppAssets.homePageAiModel,
    AppAssets.homePageCamera,
    AppAssets.homePageRetouch,
    AppAssets.homePageAutoCaptions,
    AppAssets.homePageTeleprompter,
    AppAssets.homePageImageRemoveBackground,
    AppAssets.homePageImageEnhancement,
  ];
}
