import 'package:flutter/cupertino.dart';

enum ScreenType { mobile, tablet, desktop }

class ScreenUtils {
  static ScreenType getScreenType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width > 1200) {
      return ScreenType.desktop;
    } else if (width >= 800 && width <= 1200) {
      return ScreenType.tablet;
    } else {
      return ScreenType.mobile;
    }
  }

  static bool isMobileScreen(BuildContext context) {
    return getScreenType(context) == ScreenType.mobile;
  }

  static bool isTabletScreen(BuildContext context) {
    return getScreenType(context) == ScreenType.tablet;
  }

  static bool isDesktopScreen(BuildContext context) {
    return getScreenType(context) == ScreenType.desktop;
  }
}
