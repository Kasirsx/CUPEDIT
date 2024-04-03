import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class ProjectsHomeRow extends StatelessWidget {
  const ProjectsHomeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              onPressed: () {
                print('Icons.edit_note');
              },
              icon: const Icon(
                Icons.edit_note,
                size: 30,
              ),
            )
          ],
        )
      ],
    );
  }
}
