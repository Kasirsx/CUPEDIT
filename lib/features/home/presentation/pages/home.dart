import 'package:cupcat/features/edit_new_project/presentation/widgets/select_type_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';
import '/features/home/presentation/widgets/general_home_page_scaffold.dart';
import '/features/home/presentation/widgets/grid_tranzlation_and_icons.dart';
import '/features/home/presentation/widgets/home_new_project_card.dart';
import '/features/home/presentation/widgets/projects_home_row.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                itemCount: GridItemTranslation.itemNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildFuietureWidgetItem(
                    GridItemTranslation.translatedStrings[index],
                    GridItemTranslation.itemIcons[index],
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
                  /*     pickAssets(
                    maxCount: 10,
                    requestType: RequestType.common,
                  );*/
                  _selectAssetsType(context);
                  //pickVideo(context);
                  print("object");
                  //AnimationNavigation.slidePush(context, NewProjectPage());
                },
              ),
              const ProjectsHomeRow(),
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

void _selectAssetsType(BuildContext context){
  showDialog(context: context, builder: (context) => SelectAssetsType(),);
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
              padding: const EdgeInsets.all(18),
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
          ),
        ],
      ),
    ),
  );
}
