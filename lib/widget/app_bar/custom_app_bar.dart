import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translations/util/screen_utils.dart';

class AdaptiveAppBarBuilder extends StatelessWidget
    implements PreferredSizeWidget {
  const AdaptiveAppBarBuilder({
    Key? key,
    this.toolbarHeight = kToolbarHeight,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  final double toolbarHeight;
  final PreferredSizeWidget mobile, tablet, desktop;

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

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
