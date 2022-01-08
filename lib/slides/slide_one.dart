import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:float_column/float_column.dart';

class SlideOne extends StatelessWidget {
  final String image;
  final String title;
  final String secondTitle;
  final String firstParagraph;
  final String secondParagraph;

  const SlideOne(
      {Key? key,
      required this.image,
      required this.title,
      required this.secondTitle,
      required this.firstParagraph,
      required this.secondParagraph})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(isPortrait ? 0 : 20),
            width: width,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? 700
                : 500,
            child: FloatColumn(
              children: [
                isPortrait
                    ? Image(
                        image: AssetImage('assets/images/$image'),
                        alignment: Alignment.center,
                        width: width,
                        height: height * 0.33,
                        fit: BoxFit.cover,
                      )
                    : Floatable(
                        float: FCFloat.start,
                        maxWidthPercentage: 0.33,
                        padding: const EdgeInsetsDirectional.only(end: 12),
                        child: Image(image: AssetImage('assets/images/$image')),
                      ),
                WrappableText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: title,
                        style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                                color: Colors.red[700], fontSize: 40)))),
                const SizedBox(
                  height: 5,
                ),
                WrappableText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: secondTitle,
                        style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18)))),
                const SizedBox(
                  height: 10,
                ),
                WrappableText(
                    padding: const EdgeInsets.all(15),
                    text: TextSpan(children: [
                      TextSpan(
                          text: firstParagraph,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18))),
                    ])),
                WrappableText(
                    padding: const EdgeInsets.all(15),
                    text: TextSpan(children: [
                      TextSpan(
                          text: secondParagraph,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18))),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
