import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:line_icons/line_icons.dart';

import '../app/fonts.dart';
import '../models/testimonial_model.dart';
import 'message_clipper.dart';

class TestimonialItem extends StatelessWidget {
  const TestimonialItem({super.key, required this.review});
  final TestimonialModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: 400,
            height: 250,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            decoration: const ShapeDecoration(
                color: Color(0xFFf3f9fd),
                shape: TooltipShapeBorder(
                    arrowHeight: 24, arrowWidth: 24, radius: 6)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  LineIcons.quoteLeft,
                  color: Color(0xFFc9e3f5),
                  size: 26,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '  ${review.review}',
                      maxLines: 6,
                      style: const TextStyle(
                          color: Color(0xFF444444),
                          fontFamily: Fonts.openSans,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    LineIcons.quoteRight,
                    color: Color(0xFFc9e3f5),
                    size: 26,
                  ),
                )
              ],
            )),
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 40,
          backgroundImage: AssetImage(review.image),
        ),
        Text(
          review.name,
          style: const TextStyle(
              fontFamily: Fonts.raleway,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111111)),
        ).container(padding: const EdgeInsets.only(top: 10, bottom: 5)),
        Text(
          review.role,
          style: const TextStyle(
              fontFamily: Fonts.openSans,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color(0xFF999999)),
        )
      ],
    );
  }
}
