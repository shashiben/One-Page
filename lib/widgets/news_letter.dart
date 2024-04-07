import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

import '../app/fonts.dart';

class NewsLetterWidget extends StatelessWidget {
  const NewsLetterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Join Our Newsletter',
          style: TextStyle(
              fontFamily: Fonts.raleway,
              fontWeight: FontWeight.bold,
              color: Color(0xFF444444)),
        ).container(padding: const EdgeInsets.only(bottom: 16)),
        const Text(
          'Tamen quem nulla quae legam multos aute sint culpa legam noster magna',
          style: TextStyle(
              fontFamily: Fonts.openSans,
              fontSize: 14,
              color: Color(0xFF777777)),
        ).container(padding: const EdgeInsets.only(bottom: 15)),
        SizedBox(
          height: 48,
          child: TextField(
              decoration: InputDecoration(
            suffixIcon: SizedBox(
              height: 48,
              width: 100,
              child: NextButton(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                margin: EdgeInsets.zero,
                style: const TextStyle(color: Colors.white),
                child: const Text("Subscribe"),
                onPressed: () {},
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Color(0xFFEEEEEE))),
          )),
        )
      ],
    );
  }
}
