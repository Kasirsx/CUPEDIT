import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/animations/fade_animation.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';

class ChangeVideoQuality extends StatefulWidget {
  ChangeVideoQuality({
    super.key,
    this.quality,
  });

  ValueChanged<String>? quality;

  @override
  State<ChangeVideoQuality> createState() => _ChangeVideoQualityState();
}

class _ChangeVideoQualityState extends State<ChangeVideoQuality> {
  late double _slider;
  double _sliderText = 0;
  String qualityText = '';
  int? _sliderValue() {
    //late int value;
    switch (SharedStorage.getVideoQuality()) {
      case 300:
        _slider = 0;
        setState(() {});
        break;

      case 500:
        _slider = 1;
        setState(() {});
        break;

      case 1000:
        _slider = 3;
        setState(() {});
        break;

      case 1500:
        _slider = 4;
        setState(() {});
        break;

      case 3000:
        _slider = 6;
        setState(() {});
        break;

      case 5000:
        _slider = 7;
        setState(() {});
        break;

      case 8000:
        _slider = 9;
        setState(() {});
        break;

      case 16000:
        _slider = 10;
        setState(() {});
        break;
    }

    return _slider.toInt();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sliderValue();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.25;

    return FadeAnimation(
      fadeDirection: FadeDirection.bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "video".tr(),
                          style: AppTheme.headline.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 5,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.blue.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "quality".tr(),
                        style: AppTheme.headline.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        overlayColor: AppColors.white,
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 15.0,
                        ),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 8,
                        ),
                      ),
                      child: Slider(
                        value: _slider,
                        min: 0.0,
                        max: 10.0,
                        divisions: 7,
                        autofocus: true,
                        activeColor: AppColors.blue.shade100,
                        secondaryActiveColor: Colors.amber,
                        inactiveColor: AppColors.grey,
                        label: "${_sliderText.toInt()}p",
                        onChanged: (value) {
                          print(value.toInt());

                          switch (value.toInt()) {
                            case 0:
                              setState(() {
                                _sliderText = 144;
                                SharedStorage.writeVideoQuality(300);
                                widget.quality!("144p");
                              });

                              break;
                            case 1:
                              setState(() {
                                _sliderText = 240;
                                widget.quality!("240p");
                                SharedStorage.writeVideoQuality(500);
                              });

                              break;
                            case 3:
                              setState(() {
                                _sliderText = 360;
                                widget.quality!("360p");
                                SharedStorage.writeVideoQuality(1000);
                              });

                              break;
                            case 4:
                              setState(() {
                                _sliderText = 480;
                                widget.quality!("480p");
                                SharedStorage.writeVideoQuality(1500);
                              });

                              break;
                            case 6:
                              setState(() {
                                _sliderText = 720;
                                widget.quality!("720p");
                                SharedStorage.writeVideoQuality(3000);
                              });

                              break;
                            case 7:
                              setState(() {
                                _sliderText = 1080;
                                widget.quality!("1080p");
                                SharedStorage.writeVideoQuality(5000);
                              });

                              break;
                            case 9:
                              setState(() {
                                _sliderText = 1440;
                                widget.quality!("1440p");
                                SharedStorage.writeVideoQuality(8000);
                              });

                              break;
                            case 10:
                              setState(() {
                                _sliderText = 2160;
                                widget.quality!("2kp");
                                SharedStorage.writeVideoQuality(16000);
                              });

                              break;
                          }
                          print(_sliderText.toInt());
                          setState(() {
                            _slider = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}