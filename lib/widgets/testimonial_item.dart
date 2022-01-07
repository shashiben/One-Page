import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../app/fonts.dart';
import '../extensions.dart';
import '../models/testimonial_model.dart';
import 'message_clipper.dart';

class TestimonialItem extends StatelessWidget {
  final TestimonialModel review;
  const TestimonialItem({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.pink,
          child: Container(
              width: 400,
              height: 250,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: const ShapeDecoration(
                  color: Color(0xFFf3f9fd),
                  shape: TooltipShapeBorder(arrowHeight: 18, radius: 6)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                            fontFamily: Fonts.openSans,
                            fontStyle: FontStyle.italic,
                            fontSize: 18),
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
        ),
        CircleAvatar(
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
        ).padding(const EdgeInsets.only(top: 10, bottom: 5)),
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
