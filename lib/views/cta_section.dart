import '../app/fonts.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

class CTASection extends StatelessWidget {
  const CTASection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(color: context.primaryColor),
      child: Column(
        children: [
          const Text(
            'Call To Action',
            style: TextStyle(
                fontFamily: Fonts.raleway,
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: context.width * 0.8,
            child: const Text(
              'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                  fontFamily: Fonts.openSans,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ).container(padding: const EdgeInsets.only(top: 20, bottom: 20)),
          ),
          NextButton(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              color: context.primaryColor,
              outlineColor: Colors.white,
              variant: NextButtonVariant.outlined,
              child: const Text("Call To Action"),
              style: const TextStyle(
                fontFamily: Fonts.openSans,
                fontWeight: FontWeight.w500,
              ),
              onPressed: () {})
        ],
      ).zoom(
        duration: const Duration(milliseconds: 250),
      ),
    );
  }
}
