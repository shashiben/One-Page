import 'package:bootstrap/app/colors.dart';
import 'package:bootstrap/app/data.dart';
import 'package:bootstrap/models/portfolio_model.dart';
import 'package:bootstrap/widgets/custom_dual_tone_border.dart';
import 'package:bootstrap/widgets/hover_widget.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioItem extends StatefulWidget {
  final PortfolioModel portfolioItem;
  final bool shouldDisplay;
  const PortfolioItem(
      {Key? key, required this.portfolioItem, required this.shouldDisplay})
      : super(key: key);

  @override
  State<PortfolioItem> createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem>
    with SingleTickerProviderStateMixin {
  late AnimationController scaleController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return HoverWidget(child: (context, isHovered) {
      if (isHovered) {
        scaleController.forward();
      } else {
        scaleController.reverse();
      }
      return Stack(
        children: [
          Image.asset(
            widget.portfolioItem.image,
            fit: BoxFit.fitHeight,
          ),
          Positioned.fill(
            child: ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(scaleController),
              child: Center(
                child: Container(
                  color: primaryColor.withOpacity(0.6),
                  padding: const EdgeInsets.all(20.0),
                  child: CustomPaint(
                    painter: MyPainter(),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        children: [
                          Text(
                            widget.portfolioItem.name,
                            style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            widget.portfolioItem.type.toUpperCase(),
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ).padding(const EdgeInsets.symmetric(vertical: 12)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              HoverWidget(child: (context, isHovered) {
                                return Icon(
                                  Icons.add,
                                  color: isHovered
                                      ? Colors.white
                                      : const Color.fromRGBO(
                                          255, 255, 255, 0.6),
                                ).padding(const EdgeInsets.only(right: 10));
                              }),
                              HoverWidget(
                                child: (_, isHovered) => Icon(
                                  Icons.link,
                                  color: isHovered
                                      ? Colors.white
                                      : const Color.fromRGBO(
                                          255, 255, 255, 0.6),
                                ).onTap(() {
                                  GoRouter.of(context)
                                      .push('/portfolio-details');
                                }),
                              )
                            ],
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }).onTap(() {
      setState(() {
        currentPage = portfolioItems.indexOf(widget.portfolioItem);
      });
      final pageController = PageController(
          initialPage: portfolioItems.indexOf(widget.portfolioItem));
      showDialog(
          context: context,
          builder: (_) => StatefulBuilder(builder: (context, setState) {
                return Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      PageView(
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        controller: pageController,
                        children: portfolioItems
                            .map((e) => Image.asset(
                                  e.image,
                                  fit: BoxFit.fitHeight,
                                ))
                            .toList(),
                      ),
                      Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: HoverWidget(
                              child: (_, isHovered) => Icon(
                                Icons.close,
                                color: isHovered ? Colors.white : Colors.grey,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4)),
                          ).onTap(() {
                            Navigator.pop(context);
                          })),
                      Positioned(
                          top: context.height / 2 - 20,
                          right: 15,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
                              child: HoverWidget(
                                child: (_, isHovered) => Icon(
                                  Icons.arrow_forward_ios,
                                  color: isHovered ? Colors.white : Colors.grey,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(4)),
                            ).onTap(() {
                              pageController.animateToPage(
                                  (((currentPage) + 1) % portfolioItems.length)
                                      .toInt(),
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linearToEaseOut);
                            }),
                          )),
                      Positioned(
                          top: context.height / 2 - 20,
                          left: 15,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 12)
                                  .copyWith(left: 12),
                              child: HoverWidget(
                                child: (_, isHovered) => Icon(
                                  Icons.arrow_back_ios,
                                  color: isHovered ? Colors.white : Colors.grey,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(4)),
                            ).onTap(() {
                              pageController.animateToPage(
                                  (((currentPage) - 1) % portfolioItems.length)
                                      .toInt(),
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linearToEaseOut);
                            }),
                          )),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5)),
                            child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      portfolioItems[currentPage].name,
                                      style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ).padding(const EdgeInsets.symmetric(
                                            horizontal: 20)
                                        .copyWith(bottom: 25)),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          portfolioItems.length,
                                          (index) => AnimatedContainer(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: index == currentPage
                                                      ? primaryColor
                                                      : primaryColor
                                                          .withOpacity(0.4)),
                                              duration: const Duration(
                                                  milliseconds: 300))))
                                ],
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start),
                          ))
                    ],
                  ),
                );
              }));
    });
  }
}
