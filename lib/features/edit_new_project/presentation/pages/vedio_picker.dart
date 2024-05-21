import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit_config.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import '/core/widgets/custom_text_rich.dart';
import '/core/widgets/loading.dart';
import '/features/edit_new_project/presentation/pages/general_edit_video.dart';
import '/features/edit_new_project/presentation/widgets/asset_widget_builder.dart';
import '/features/edit_new_project/presentation/widgets/media_services.dart';
import '/features/edit_new_project/presentation/widgets/selected_assets_list_view.dart';

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

  final ValueNotifier<bool> isDisplayingDetail = ValueNotifier<bool>(true);

  @override
  void dispose() {
    isDisplayingDetail.dispose();
    super.dispose();
  }

  void removeAsset(int index) {
    widget.selectedAssetList.removeAt(index);
    setState(() {});
  }

  void onResult(List<AssetEntity>? result) {
    if (result != null && result != widget.selectedAssetList) {
      widget.selectedAssetList = result.toList();
      if (mounted) {
        setState(() {});
      }
    }
  }

  late final DefaultAssetPickerProvider provider = DefaultAssetPickerProvider(
    maxAssets: 10,
    requestType: RequestType.all,
  );

  @override
  Widget build(BuildContext context) {
    return widget.albumList.isEmpty
        ? Center(
            child: Text(
              "there_is_no_videos".tr(),
              style: AppTheme.headline.copyWith(
                color: AppColors.white,
              ),
            ),
          )
        : widget.assetList.isEmpty
            ? const Center(
                child: LoadingWidget(
                  color: Colors.red,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.assetList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.5,
                        mainAxisSpacing: 5.5,
                      ),
                      itemBuilder: (context, index) {
                        if (index < widget.assetList.length) {
                          // AssetEntity assetEntity = widget.assetList[index];
                          final AssetEntity assetEntity =
                              widget.assetList.elementAt(index);

                          final Duration duration = assetEntity.videoDuration;

                          final minutes = duration.inMinutes.remainder(60);
                          final seconds = duration.inSeconds.remainder(60);

                          return Stack(
                            children: [
                              ValueListenableBuilder<bool>(
                                valueListenable: isDisplayingDetail,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.red,
                                ),
                                builder: (_, bool value, __) => GestureDetector(
                                  onTap: () async {
                                    if (value) {
                                      final List<AssetEntity>? result =
                                          await AssetPickerViewer.pushToViewer(
                                        context,
                                        currentIndex: index,
                                        selectedAssets: widget.assetList,
                                        specialPickerType:
                                            SpecialPickerType.noPreview,
                                        previewAssets: widget.assetList,
                                        selectorProvider: provider,
                                        themeData:
                                            AssetPicker.themeData(Colors.white),
                                        //themeData: AssetPicker.themeData(themeColor),
                                      );
                                      onResult(result);
                                    }
                                  },
                                  child: RepaintBoundary(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: AssetWidgetBuilder(
                                        entity: assetEntity,
                                        isDisplayingDetail: value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: SharedStorage.getLanguage() == "en"
                                      ? Alignment.topRight
                                      : Alignment.topLeft,
                                  child: GestureDetector(
                                    onTap: () => selectedAssets(
                                        assetEntity: assetEntity),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        width: 22.5,
                                        height: 22.5,
                                        decoration: BoxDecoration(
                                          color: widget.selectedAssetList
                                                      .contains(assetEntity) ==
                                                  true
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
                                              color: widget.selectedAssetList
                                                          .contains(
                                                              assetEntity) ==
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
                              Positioned.fill(
                                child: Align(
                                  alignment: SharedStorage.getLanguage() == "en"
                                      ? Alignment.bottomLeft
                                      : Alignment.bottomRight,
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.5),
                                    child: Icon(
                                      Icons.video_collection_sharp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: SharedStorage.getLanguage() == "en"
                                      ? Alignment.bottomRight
                                      : Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.5),
                                    child: Text(
                                      '$minutes:${seconds.toString().padLeft(2, '0')}',
                                      style: AppTheme.bodyText1.copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SelectedAssetsListView(
                      assets: widget.selectedAssetList,
                      isDisplayingDetail: isDisplayingDetail,
                      onResult: onResult,
                      onRemoveAsset: removeAsset,
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2.5),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: widget.selectedAssetList.isEmpty
                              ? AppColors.grey
                              : AppColors.green,
                        ),
                        child: InkWell(
                          onTap: () async {
                            if (widget.selectedAssetList.isNotEmpty) {
                              for (AssetEntity asset
                                  in widget.selectedAssetList) {
                                File? path = await asset.file;
                                if (path != null) {
                                  print(path.path);

                                  FFmpegKitConfig.init().then(
                                    (value) => AnimationNavigation
                                        .scalePushReplacement(
                                      context,
                                      /*CutVideos(
                                      file: File(path.path),
                                    ),*/
                                      GeneralEditVideos(
                                        totalVideoDuration:
                                            asset.videoDuration.inMilliseconds,
                                        file: File(path.path),
                                      ),
                                    ),
                                  );
                                  print('Selected Asset Path: $path');
                                }
                              }
                            }
                          },
                          child: CustomTextRich(
                            mainText: "add",
                            secondText: widget.selectedAssetList.isEmpty
                                ? ""
                                : " (${widget.selectedAssetList.length})",
                            secondStyle: AppTheme.headline
                                .copyWith(color: AppColors.white),
                            mainStyle: AppTheme.headline
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
  }

/*  Widget assetWidget(AssetEntity assetEntity) {
    return Stack(
      children: [
        Positioned.fill(
          child: InkWell(
            onTap: () {
              Navigation.push(
                context,
                PickerImageOrVideo(
                  assetEntity: assetEntity,
                ),
              );
            },
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
        ),
        if (assetEntity.type == AssetType.video)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${assetEntity.videoDuration}",
                      style: AppTheme.bodySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const Icon(
                      Icons.video_call,
                      color: Colors.red,
                    ),
                  ],
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
  }*/

  List<File> selectedAssetPathList = <File>[];

  void selectedAssets({required AssetEntity assetEntity}) {
    if (widget.selectedAssetList.contains(assetEntity)) {
      setState(() {
        widget.selectedAssetList.remove(assetEntity);
        print(widget.selectedAssetList);
        assetEntity.file.then((value) {
          print(value);
          selectedAssetPathList.remove(value!);
        });
      });
    } else if (widget.selectedAssetList.length < widget.maxCount) {
      setState(() {
        widget.selectedAssetList.add(assetEntity);
        assetEntity.file.then((value) {
          print(value);
          selectedAssetPathList.add(value!);
        },);
        //selectedAssetPathList.add(assetPathEntity!);
        print(widget.selectedAssetList);
      });
    }
  }

/*  selectedAssets({required AssetEntity assetEntity}) {
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

  List<File> selectedAssetPathList = [];

  selectedPathAssets({required AssetEntity assetEntity}) async {
    if (widget.selectedAssetList.contains(assetEntity)) {
      setState(() {
        widget.selectedAssetList.remove(assetEntity);
      });
    } else if (widget.selectedAssetList.length < widget.maxCount) {
      // Get the file path from the selected asset
      File? file = await assetEntity.file;

      if (file != null && file.existsSync()) {
        setState(() {
          widget.selectedAssetList.add(file);
        });
      } else {
        // Handle case when file is null or doesn't exist
        print('File is null or does not exist');
      }
    }
  }*/
}
