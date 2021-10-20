// ignore_for_file: unnecessary_const

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translations/asset/color_assets.dart';
import 'package:flutter_translations/asset/icon_assets.dart';
import 'package:flutter_translations/asset/theme_assets.dart';
import 'package:flutter_translations/controller/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;

  @override
  void initState() {
    controller = Get.put(HomeController());
    super.initState();
  }

  void selectFile() {
    controller.selectFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              appBar(),
              body(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      constraints: const BoxConstraints(minHeight: 75),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(flex: 1, child: SizedBox.shrink()),
          Expanded(
            flex: 8,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: Text(
                    'Flutter Translations',
                    style: ThemeAssets.headline6?.copyWith(
                      color: ColorAssets.primary,
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: selectFile,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            elevation: MaterialStateProperty.all<double>(0),
          ),
          icon: Container(
            margin: const EdgeInsets.only(right: 4),
            child: SvgPicture.asset(
              IconAssets.excelFile,
              color: Colors.white,
            ),
            // child: const FaIcon(
            //   FontAwesomeIcons.file,
            //   size: 16,
            // ),
          ),
          label: Text(
            'Pick File',
            style: ThemeAssets.button?.copyWith(
              color: ColorAssets.white,
              fontSize: 18,
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              IconAssets.android,
              color: Colors.white,
              colorBlendMode: BlendMode.saturation,
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              IconAssets.flutter,
              color: Colors.white,
              colorBlendMode: BlendMode.saturation,
            ),
          ),
        ),
      ],
    );
  }

  Widget footer() {
    return Container(
      constraints: const BoxConstraints(minHeight: 50),
      color: ColorAssets.black,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            '\u00a9 Nikhil Koshty. All Rights Reserved',
            style: TextStyle(
              color: ColorAssets.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
