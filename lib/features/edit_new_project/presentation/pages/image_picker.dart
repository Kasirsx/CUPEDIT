import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/core/constants/app_colors.dart';
import '/core/widgets/loading.dart';
import '/features/edit_new_project/presentation/widgets/media_services.dart';

class ImagePicker extends StatefulWidget {
  ImagePicker({
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
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  final RequestType requestType = RequestType.image;

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
                    color: AppColors.red,
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
                  color: AppColors.red,
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
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "${widget.selectedAssetList.indexOf(assetEntity) + 1}",
                      style: TextStyle(
                        color: widget.selectedAssetList.contains(assetEntity) ==
                                true
                            ? AppColors.white
                            : AppColors.transparent,
                      ),
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
