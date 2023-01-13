import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlideZero extends StatelessWidget {
  final Function startLesson;
  const SlideZero(this.startLesson, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Theme.of(context).backgroundColor.withOpacity(0.9),
                    BlendMode.darken),
                image: AssetImage(isPortrait
                    ? "assets/images/backPortrait.png"
                    : "assets/images/backLandscape.png"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isPortrait
                  ? Column(
                      children: [
                        Image.asset('assets/images/view.png',
                            width: 80, height: 80),
                        const SizedBox(
                          height: 15,
                        ),
                        AutoSizeText(
                          'Accelerated Learning',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/view.png',
                            width: 80, height: 80),
                        const SizedBox(
                          width: 20,
                        ),
                        AutoSizeText(
                          'Accelerated Learning',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ],
                    ),
              const Expanded(child: SizedBox()),
              isPortrait
                  ? Column(
                      children: [
                        AutoSizeText(
                          'How I Remember',
                          maxLines: 1,
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 48,
                          )),
                        ),
                        AutoSizeText(
                          'Everything I Read',
                          maxLines: 1,
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 48,
                          )),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'How I Remember',
                          maxLines: 1,
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 48,
                          )),
                        ),
                        AutoSizeText(
                          'Everything I Read',
                          maxLines: 1,
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 48,
                          )),
                        ),
                      ],
                    ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => startLesson(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Start Lesson',
                  style: GoogleFonts.robotoSlab(
                      textStyle: const TextStyle(
                    color: Color(0xff008080),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ))),
              const Icon(
                Icons.keyboard_arrow_right_sharp,
                size: 30,
                color: Color(0xff008080),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
