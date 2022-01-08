import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state_managment/dark_mode_state_manager.dart';
import 'slides/slide_zero.dart';
import 'slides/slide_one.dart';
import 'package:flutter/services.dart';

import 'package:flutter/gestures.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  void startLesson() {
    pageControllerH.nextPage(
        duration: const Duration(milliseconds: 3), curve: Curves.fastOutSlowIn);
  }

  int page = 0;
  List<Widget> list = [];

  PageController pageControllerH = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    loadData();
    list = [
      SlideZero(startLesson),
    ];
  }

  Future<void> loadData() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/slides.json");
    final jsonResult = jsonDecode(data); //latest Dart
    setState(() {
      jsonResult.forEach((slide) {
        list.add(SlideOne(
            image: slide['image'],
            title: slide['title'],
            secondTitle: slide['second title'],
            firstParagraph: slide['first paragraph'],
            secondParagraph: slide['second paragraph']));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (int newpage) {
                setState(() {
                  page = newpage;
                });
              },
              scrollDirection: Axis.horizontal,
              controller: pageControllerH,
              scrollBehavior:
                  ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              }),
              children: list,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            color: Colors.blue,
            width: double.infinity,
            height: 40,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1- OverLoad',
                      style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 11))),
                  Text(
                    'Introduction',
                    style: GoogleFonts.robotoCondensed(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.keyboard_arrow_left_sharp,
                          color: Colors.white,
                        ),
                        iconSize: 30,
                        onPressed: () {
                          if (page > 0) {
                            pageControllerH.previousPage(
                                duration: const Duration(milliseconds: 3),
                                curve: Curves.fastOutSlowIn);
                          }
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            '$page',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '/',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '${list.length - 1}',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Colors.white,
                        ),
                        iconSize: 30,
                        onPressed: () {
                          if (page < list.length) {
                            pageControllerH.nextPage(
                                duration: const Duration(milliseconds: 3),
                                curve: Curves.fastOutSlowIn);
                          }
                        },
                      ),
                      PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        onSelected: (String value) => ref
                            .read(darkModeStateManagerProvider.notifier)
                            .switchDarkMode(),
                        itemBuilder: (BuildContext context) {
                          return {
                            Theme.of(context).brightness == Brightness.light
                                ? 'enable dark mode'
                                : 'disable dark mode'
                          }.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
