import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:line_icons/line_icons.dart';

import '../app/fonts.dart';
import '../app/text_styles.dart';
import '../widgets/contact_info_list_tile.dart';
import '../widgets/text_field.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'CONTACT',
                style: SectionTitle.h2(context),
                textAlign: TextAlign.center,
              ),
              Text(
                'Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.',
                style: SectionTitle.p(context),
                textAlign: TextAlign.center,
              ).container(padding: const EdgeInsets.only(top: 10, bottom: 20)),
            ],
          ),
          NextRow(children: <NextCol>[
            const NextCol(
                widthPercentages: <GridPrefix, double>{
                  GridPrefix.xs: 100,
                  GridPrefix.sm: 100,
                  GridPrefix.md: 100,
                  GridPrefix.lg: 33.33,
                  GridPrefix.xl: 33.33
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ContactListTile(
                        title: 'Location:',
                        subtitle: 'Kurnool,Andhra Pradesh,518001',
                        leadingIcon: LineIcons.locationArrow),
                    ContactListTile(
                        title: 'Email:',
                        subtitle: 'kumarshashi5294@gmail.com',
                        leadingIcon: Icons.email_outlined),
                    ContactListTile(
                        title: 'Call:',
                        subtitle: '+91-797217156',
                        leadingIcon: Icons.mobile_friendly_rounded)
                  ],
                )),
            NextCol(
                widthPercentages: const <GridPrefix, double>{
                  GridPrefix.xs: 100,
                  GridPrefix.sm: 100,
                  GridPrefix.md: 100,
                  GridPrefix.lg: 66.66,
                  GridPrefix.xl: 66.66
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CommonTextField(
                              controller: nameController, hint: 'Your name'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CommonTextField(
                              controller: nameController, hint: 'Your Email'),
                        )
                      ],
                    ),
                    CommonTextField(
                        controller: nameController, hint: 'Subject'),
                    CommonTextField(
                        controller: nameController,
                        hint: 'Message',
                        maxLines: 4),
                    NextButton(
                      color: context.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 12),
                      margin: const EdgeInsets.only(top: 30),
                      onPressed: () {},
                      style: const TextStyle(
                          fontFamily: Fonts.poppins,
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      child: const Text('Send Message'),
                    )
                  ],
                ))
          ])
        ],
      ).container(
          padding: EdgeInsets.symmetric(
              vertical: 60, horizontal: context.isMobile ? 20 : 60)),
    );
  }
}
