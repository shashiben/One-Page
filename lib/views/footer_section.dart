import 'package:bootstrap/app/colors.dart';
import 'package:bootstrap/bootstrap_button.dart';
import 'package:bootstrap/bootstrap_col.dart';
import 'package:bootstrap/bootstrap_row.dart';
import 'package:bootstrap/widgets/footer_item.dart';
import 'package:bootstrap/widgets/news_letter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.isMobile ? 20 : context.width * 0.05,
              vertical: 40),
          color: Colors.white,
          child: BootstrapRow(verticalSpacing: 30, children: [
            BootstrapCol(
                sizes: "col-12 cik-md-6 col-lg-3",
                child: Column(
                  children: [
                    Text(
                      "OnePage",
                      style: GoogleFonts.raleway(
                          fontSize: 26, color: const Color(0xFF444444)),
                    ).padding(const EdgeInsets.only(bottom: 10)),
                    Text(
                      "A108 Adam Street\nNew York, NY 535022\nUnited States",
                      style: GoogleFonts.raleway(
                          height: 1.5,
                          fontSize: 14,
                          color: const Color(0xFF777777)),
                    ).padding(const EdgeInsets.only(bottom: 15)),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Phone:",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color(0xFF444444))),
                      TextSpan(
                          text: "+91-7997217156",
                          style: GoogleFonts.raleway(
                              fontSize: 14, color: const Color(0xFF777777)))
                    ])).padding(const EdgeInsets.only(bottom: 8)),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Email:",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color(0xFF444444))),
                      TextSpan(
                          text: "kumarshashi5294@gmail.com",
                          style: GoogleFonts.raleway(
                              fontSize: 14, color: const Color(0xFF777777)))
                    ]))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )),
            BootstrapCol(
                sizes: "col-12 col-md-6 col-lg-2",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Useful Links",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: textPrimaryColor),
                    ).padding(const EdgeInsets.only(bottom: 12)),
                    const FooterItem(title: "Home"),
                    const FooterItem(title: "About us"),
                    const FooterItem(title: "Services"),
                    const FooterItem(title: "Terms of service"),
                    const FooterItem(title: "Privacy policy"),
                  ],
                )),
            BootstrapCol(
                sizes: "col-12 col-md-6 col-lg-3",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Services",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: textPrimaryColor),
                    ).padding(const EdgeInsets.only(bottom: 12)),
                    const FooterItem(title: "Web Design"),
                    const FooterItem(title: "Web Development"),
                    const FooterItem(title: "Product Management"),
                    const FooterItem(title: "Marketing"),
                    const FooterItem(title: "Graphic Design"),
                  ],
                )),
            BootstrapCol(
                sizes: "col-12 col-md-6 col-lg-4",
                child: const NewsLetterWidget())
          ]),
          width: context.width,
        ),
        Container(
          color: const Color(0xFFF8FBFE),
          padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: context.isMobile ? 20 : context.width * 0.05),
          width: context.width,
          child: Container(
            child: BootstrapRow(
                verticalSpacing: 15,
                verticalAlignment: MainAxisAlignment.center,
                children: [
                  BootstrapCol(
                      sizes: "col-12 col-md-6",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(TextSpan(
                              style: GoogleFonts.openSans(),
                              children: [
                                const TextSpan(text: "© Copyright "),
                                TextSpan(
                                    text: "OnePage. ",
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold)),
                                const TextSpan(text: "All Rights Reserved")
                              ])).padding(const EdgeInsets.only(bottom: 10)),
                          Text.rich(TextSpan(
                              style: GoogleFonts.openSans(),
                              children: [
                                const TextSpan(text: "Coded by "),
                                TextSpan(
                                    text: "Shashi Kumar. ",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    style: GoogleFonts.openSans(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ])),
                        ],
                      )),
                  BootstrapCol(
                      sizes: "col-12 col-lg-6 col-md-6",
                      child: Row(
                        mainAxisAlignment: context.isMobile
                            ? MainAxisAlignment.spaceAround
                            : MainAxisAlignment.end,
                        children: [
                          BootstrapButton(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              child: (isHovered) => const Icon(
                                    Icons.facebook_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                              onPressed: () {}),
                          BootstrapButton(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              child: (isHovered) => const Icon(
                                    LineIcons.instagram,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                              onPressed: () {}),
                          BootstrapButton(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              child: (isHovered) => const Icon(
                                    LineIcons.linkedinIn,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                              onPressed: () {}),
                          BootstrapButton(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              child: (isHovered) => const Icon(
                                    LineIcons.github,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                              onPressed: () {}),
                          BootstrapButton(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              child: (isHovered) => const Icon(
                                    LineIcons.facebook,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                              onPressed: () {}),
                        ],
                      ))
                ]),
            color: const Color(0xFFF8FBFE),
            width: context.width,
          ),
        ),
      ],
    );
  }
}
