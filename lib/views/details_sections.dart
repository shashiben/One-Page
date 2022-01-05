import 'package:bootstrap/app/data.dart';
import 'package:bootstrap/bootstrap_col.dart';
import 'package:bootstrap/bootstrap_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bootstrap/extensions.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FBFE),
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: BootstrapRow(
          children: details.entries
              .map((e) => BootstrapCol(
                  sizes: "col-6 col-md-6 col-lg-3 col-sm-6 col-xs-6",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${e.value}",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 48,
                              color: const Color(0xFF124265))),
                      Text(
                        e.key,
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ).padding(const EdgeInsets.only(top: 8))
                    ],
                  )))
              .toList()),
    );
  }
}
