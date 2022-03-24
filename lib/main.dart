import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Change color statusBar & navigation
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    // Disable Landscape
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Visit',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BubbleBlock(
                    hexColor: 'F82B40',
                    hexColor2: 'FCB401',
                    size: 170,
                    postion: 100,
                  ),
                  const BubbleBlock(
                    hexColor: 'F93800',
                    hexColor2: 'FFB500',
                    size: 60,
                    postion: 0,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/newlogo.png',
                    width: 360,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            contentCard(context)
          ],
        ),
      ),
    );
  }
}

Widget contentCard(context) {
  return Center(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05))
                ], borderRadius: BorderRadius.circular(32)),
              ),
            ),
            Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Opacity(
                opacity: 0.9,
                child: SvgPicture.asset(
                  'assets/qr-nhatrangtrip-app.svg',
                  width: 260,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            )),
          ])));
}

class BubbleBlock extends StatelessWidget {
  const BubbleBlock({
    Key? key,
    required this.hexColor,
    required this.hexColor2,
    required this.size,
    required this.postion,
  }) : super(key: key);
  final String hexColor;
  final String hexColor2;
  final double size;
  final double postion;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(left: postion),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [HexColor(hexColor), HexColor(hexColor2)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
