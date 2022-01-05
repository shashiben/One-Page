import 'package:bootstrap/bootstrap_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bootstrap/extensions.dart';

class NewsLetterWidget extends StatelessWidget {
  const NewsLetterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Join Our Newsletter",
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold, color: const Color(0xFF444444)),
        ).padding(const EdgeInsets.only(bottom: 16)),
        Text(
          "Tamen quem nulla quae legam multos aute sint culpa legam noster magna",
          style: GoogleFonts.openSans(
              fontSize: 14, color: const Color(0xFF777777)),
        ).padding(const EdgeInsets.only(bottom: 15)),
        SizedBox(
          height: 48,
          child: TextField(
              decoration: InputDecoration(
            suffixIcon: SizedBox(
              height: 48,
              width: 100,
              child: BootstrapButton(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                child: (isHovered) => Center(
                  child: Text(
                    "Subscribe",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  ).padding(const EdgeInsets.symmetric(horizontal: 15)),
                ),
                onPressed: () {},
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Color(0xFFEEEEEE))),
          )),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
