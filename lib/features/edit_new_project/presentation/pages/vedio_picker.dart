import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/features/edit_new_project/presentation/widgets/media_services.dart';

class VideoPicker extends StatefulWidget {
  VideoPicker({
    super.key,
    required this.maxCount,
    required this.selectedAlbum,
    required this.albumList,
    required this.assetList,
    required this.selectedAssetList,
  });

  final int maxCount;
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList;
  List<AssetEntity> assetList;

  List<AssetEntity> selectedAssetList;

  @override
  State<VideoPicker> createState() => _VideoPickerState();
}

class _VideoPickerState extends State<VideoPicker> {
  final RequestType requestType = RequestType.video;

  //int MaxCount

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MediaServices().loadAlbums(requestType).then((value) {
      setState(() {
        widget.albumList = value;
        widget.selectedAlbum = value[0];
      });

      MediaServices().loadAssets(widget.selectedAlbum!).then((value) {
        setState(() {
          widget.assetList = value;
        });
      });
    });
    // _albumCount;
  }

  @override
  Widget build(BuildContext context) {
    return widget.assetList.isEmpty
        ? const Center(
            child: LoadingWidget(
              color: AppColors.red,
            ),
          )
        : GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.assetList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              AssetEntity assetEntity = widget.assetList[index];
              return Padding(
                padding: const EdgeInsets.all(2),
                child: assetWidget(assetEntity),
              );
            },
          );
  }

  Widget assetWidget(AssetEntity assetEntity) {
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(
              widget.selectedAssetList.contains(assetEntity) == true ? 8 : 0,
            ),
            child: AssetEntityImage(
              assetEntity,
              isOriginal: false,
              thumbnailSize: const ThumbnailSize.square(250),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
        ),
        if (assetEntity.type == AssetType.video)
          const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.video_call,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => selectedAssets(assetEntity: assetEntity),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 22.5,
                  height: 22.5,
                  decoration: BoxDecoration(
                    color:
                        widget.selectedAssetList.contains(assetEntity) == true
                            ? AppColors.blue
                            : AppColors.black12,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "${widget.selectedAssetList.indexOf(assetEntity) + 1}",
                      style: AppTheme.bodySmall.copyWith(
                          color:
                              widget.selectedAssetList.contains(assetEntity) ==
                                      true
                                  ? AppColors.white
                                  : AppColors.transparent,),
                      /*   style: TextStyle(
                        color: widget.selectedAssetList.contains(assetEntity) ==
                                true
                            ? AppColors.white
                            : AppColors.transparent,
                      ),*/
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  selectedAssets({required AssetEntity assetEntity}) {
    if (widget.selectedAssetList.contains(assetEntity)) {
      setState(() {
        widget.selectedAssetList.remove(assetEntity);
      });
    } else if (widget.selectedAssetList.length < widget.maxCount) {
      setState(() {
        widget.selectedAssetList.add(assetEntity);
      });
    }
  }
}
