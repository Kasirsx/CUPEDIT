import 'package:cupcat/core/constants/app_colors.dart';
import 'package:cupcat/core/constants/app_theme.dart';
import 'package:cupcat/core/widgets/custom_image.dart';
import 'package:cupcat/features/home/presentation/widgets/grid_tranzlation_and_icons.dart';
import 'package:cupcat/features/home/presentation/widgets/home_new_project_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/features/home/presentation/widgets/general_home_page_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

/*  final List<String> itemNames = [
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

  final List itemsData = [
    {
      "imgSrc": AppAssets.homePageIconArrows,
      "title": "photo_edit".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconEdit,
      "title": "text_to_image".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "autoCut".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "prodect_photo".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "collapse".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "ai_poster".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "ai_model".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "camera".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "retouch".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "auto_captions".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "teleprompter".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "remove_background".tr(),
    },
    {
      "imgSrc": AppAssets.homePageIconImage,
      "title": "image_enhancement".tr(),
    },
  ];*/

  @override
  Widget build(BuildContext context) {
    return GeneralHomePageScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...[
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 25,
                  mainAxisExtent: 100,
                ),
                itemCount: GridItemTranzlation.itemNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildFuietureWidgetItem(
                    GridItemTranzlation.translatedStrings[index],
                    GridItemTranzlation.itemIcons[index],
                    onTap: () {
                      print(index);
                    },
                  );
                },
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'press_and_drag_to_reorder'.tr(),
                  style: AppTheme.bodySmall,
                ),
              ),
              HomeNewProjectCard(
                onTap: () {
                  print("object");
                },
              ),




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Projects".tr(),
                    style: AppTheme.headline,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          print("space");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.lightBlueAccent, width: 1.5)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.cloud_upload,
                                color: AppColors.lightBlueAccent,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "space".tr(),
                                style: AppTheme.bodySmall.copyWith(
                                  color: AppColors.lightBlueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_note,size: 30,),
                      )
                    ],
                  )
                ],
              ),
            ].expand(
              (element) => [
                element,
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFuietureWidgetItem(String title, String imagePath,
    {void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CustomImage.rectangle(
                  image: imagePath,
                  svg: false,
                  isNetworkImage: false,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: AppTheme.bodySmall.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
