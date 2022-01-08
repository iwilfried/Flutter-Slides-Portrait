import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlideTwo extends StatelessWidget {
  const SlideTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: width,
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: AutoSizeText(
                "JETZT BIST DU",
                maxLines: 2,
                style: GoogleFonts.oswald(
                    textStyle: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 48)),
              ),
            ),
            Flexible(
              child: AutoSizeText("DRAN!",
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 48))),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '👉 ',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 19))),
                    TextSpan(
                        text:
                            ' Lies Dir die Schritt für Schritt Anleitung durch.',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                color: Colors.blue, fontSize: 19))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
