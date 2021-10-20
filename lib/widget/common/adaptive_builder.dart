import 'package:flutter/material.dart';
import 'package:flutter_translations/util/screen_utils.dart';

class AdaptiveBuilder extends StatelessWidget {
  final Widget mobile, tablet, desktop;

  const AdaptiveBuilder({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (ScreenUtils.getScreenType(context)) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet;
      case ScreenType.desktop:
        return desktop;
    }
  }
}
