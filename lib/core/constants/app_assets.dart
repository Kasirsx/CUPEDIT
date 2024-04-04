class AppAssets {
  AppAssets._();

  static const String baseDbURI = 'assets/images/db/';
  static const String personDbURI = '${baseDbURI}person_image.jpg';

  static const String baseAssetsURI = 'assets/images/';
  static const String mainBackground = '${baseAssetsURI}main_background.png';
  static const String noData = '${baseAssetsURI}no_data.png';
  static const String errorData = '${baseAssetsURI}error.png';

//logo
  static const String baseLogoURI = '${baseAssetsURI}logo/';
  static const String logoURI = '${baseLogoURI}app_icon.png';

  // static String get appName => SharedStorage.getLanguage() == "ar"
  //     ? "${baseLogoURI}app_name_ar.svg"
  //     : "${baseLogoURI}app_name_en.svg";
  //
  // static String get appNameGeneral => SharedStorage.getLanguage() == "ar"
  //     ? "${baseLogoURI}app_name_general_ar.svg"
  //     : "${baseLogoURI}app_name_general_en.svg";

  /*static String get splashLogo => SharedStorage.getLanguage() == "ar"
      ? baseLogoURI + "splash_logo_ar.png"
      : baseLogoURI + "splash_logo_en.png";*/
  static String splashLogo = "${baseLogoURI}splash_logo.png";

  //splash
  static const String baseSplashURI = '${baseAssetsURI}splash/';

  static const String splashBackGroundImageURI =
      '${baseSplashURI}splash_background.jpg';

  //auth assets
  static const String baseAuthURI = '${baseAssetsURI}auth/';

  static const String changeLanguageURI = '${baseAuthURI}changeLanguage.svg';

  //final auth
  static const String loginIcon = '${baseAuthURI}login_icon.svg';
  static const String registrationNewAccount =
      '${baseAuthURI}registeration_new_account.svg';
  static const String verifyCode = '${baseAuthURI}verify_code.svg';

  //request  asset
  static const String baseRequestURI = '${baseAssetsURI}request/';
  static const String cameraIcon = '${baseRequestURI}camera.svg';
  static const String galleryIcon = '${baseRequestURI}gallery.svg';
  static const String uploadImageIcon = '${baseRequestURI}uploadImage.svg';
  static const String saveTempIcon = '${baseRequestURI}saveTemp.svg';

  //place holder
  static const String placeHolder =
      'assets/images/place_holders/place_holder.png';

  //Home  asset
  static const String baseHomeURI = '${baseAssetsURI}home/';
  static const String appBackgroundURI = '${baseHomeURI}app_background_1.png';

  ///Home Page
  static const String homePageIconArrows = '${baseHomeURI}arrows.png';
  static const String homePageIconEdit = '${baseHomeURI}edit-image.png';
  static const String homePageIconImage = '${baseHomeURI}image.png';
  static const String homePageImageEnhancement =
      '${baseHomeURI}image_enhancement.png';
  static const String homePageImageRemoveBackground =
      '${baseHomeURI}remove_background.png';
  static const String homePageTeleprompter = '${baseHomeURI}teleprompter.png';
  static const String homePageAutoCaptions = '${baseHomeURI}auto_captions.png';
  static const String homePageRetouch = '${baseHomeURI}retouch.png';
  static const String homePageCamera = '${baseHomeURI}camera.png';
  static const String homePageAiPoster = '${baseHomeURI}ai_poster.png';
  static const String homePageCollapse = '${baseHomeURI}collapse.png';
  static const String homePageProductPhoto = '${baseHomeURI}product_photo.png';
  static const String homePageAutoCut = '${baseHomeURI}autoCut.png';
  static const String homePageAiModel = '${baseHomeURI}ai_model.png';



 ////New Project
  static const String baseNewProject = '${baseAssetsURI}new_project/';
  static const String cancelNewProject = '${baseNewProject}close.png';
  static const String saveEditImageOrVideoNewProject = '${baseNewProject}save_edit_image_or_video.png';
}
