// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_translations/asset/color_assets.dart';
import 'package:flutter_translations/controller/home_controller.dart';
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
                  child: const Text(
                    'Flutter Translations',
                    style: TextStyle(
                      color: ColorAssets.primary,
                      fontSize: 20,
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
        ElevatedButton(
          onPressed: selectFile,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          child: const Text(
            'Pick File',
            style: TextStyle(
              color: ColorAssets.white,
              fontSize: 18,
            ),
          ),
        )
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
