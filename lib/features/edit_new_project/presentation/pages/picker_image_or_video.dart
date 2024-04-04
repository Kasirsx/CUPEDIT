// import 'package:flutter/material.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
//
// import '/features/edit_new_project/presentation/widgets/general_new_project_scaffold.dart';
//
// class PickerImageOrVideo extends StatelessWidget {
//   const PickerImageOrVideo({
//     super.key,
//     required this.assetEntity,
//   });
//
//   final AssetEntity assetEntity;
//
//   @override
//   Widget build(BuildContext context) {
//     return GeneralNewProjectScaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (assetEntity.type == AssetType.image)
//             Center(
//               child: Image(
//                 image: AssetEntityImageProvider(assetEntity,
//                     thumbnailFormat: ThumbnailFormat.png,),
//               ),
//             ),
//           if (assetEntity.type == AssetType.video) Center(
//
//           ),
//         ],
//       ),
//     );
//     /*return AssetEntityImageProvider(assetEntity);*/
//   }
// }
