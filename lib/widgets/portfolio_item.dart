import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:go_router/go_router.dart';

import '../app/data.dart';
import '../app/fonts.dart';
import '../models/portfolio_model.dart';
import 'custom_dual_tone_border.dart';

class PortfolioItem extends StatefulWidget {
  const PortfolioItem(
      {super.key, required this.portfolioItem, required this.shouldDisplay});
  final PortfolioModel portfolioItem;
  final bool shouldDisplay;

  @override
  State<PortfolioItem> createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return HoverableWidget(
        hoverTransitionDuration: const Duration(milliseconds: 1000),
        hoverBuilder: (BuildContext context, bool isHovered) {
          if (isHovered) {
            scaleController.forward();
          } else {
            scaleController.reverse();
          }
          return Stack(
            children: <Widget>[
              Image.asset(widget.portfolioItem.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: double.infinity),
              Positioned.fill(
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.0, end: 1.0)
                      .animate(scaleController),
                  child: Center(
                    child: Container(
                      color: context.primaryColor.withValues(alpha: .6),
                      padding: const EdgeInsets.all(20.0),
                      child: CustomPaint(
                        painter: MyPainter(),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.portfolioItem.name,
                                style: const TextStyle(
                                    fontFamily: Fonts.raleway,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                widget.portfolioItem.type.toUpperCase(),
                                style: const TextStyle(
                                    fontFamily: Fonts.openSans,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ).container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  HoverableWidget(hoverBuilder:
                                      (BuildContext context, bool isHovered) {
                                    return Icon(
                                      Icons.add,
                                      color: isHovered
                                          ? Colors.white
                                          : const Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                    )
                                        .container(
                                            padding: const EdgeInsets.only(
                                                right: 10))
                                        .onTap(() {
                                      setState(() {
                                        currentPage = portfolioItems
                                            .indexOf(widget.portfolioItem);
                                      });
                                      final PageController pageController =
                                          PageController(
                                              initialPage:
                                                  portfolioItems.indexOf(
                                                      widget.portfolioItem));
                                      showDialog<void>(
                                          context: context,
                                          builder: (_) =>
                                              StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      void Function(
                                                              void Function())
                                                          setState) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: Stack(
                                                    children: <Widget>[
                                                      PageView(
                                                        onPageChanged:
                                                            (int index) {
                                                          setState(() {
                                                            currentPage = index;
                                                          });
                                                        },
                                                        controller:
                                                            pageController,
                                                        children: portfolioItems
                                                            .map((PortfolioModel
                                                                    e) =>
                                                                Image.asset(
                                                                  e.image,
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                ))
                                                            .toList(),
                                                      ),
                                                      Positioned(
                                                          top: 15,
                                                          right: 15,
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4)),
                                                            child:
                                                                HoverableWidget(
                                                              hoverBuilder: (_,
                                                                      bool
                                                                          isHovered) =>
                                                                  Icon(
                                                                Icons.close,
                                                                color: isHovered
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey,
                                                              ),
                                                            ),
                                                          ).onTap(() {
                                                            Navigator.pop(
                                                                context);
                                                          })),
                                                      Positioned(
                                                          top: context.height /
                                                                  2 -
                                                              20,
                                                          right: 15,
                                                          child: Center(
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          12),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4)),
                                                              child:
                                                                  HoverableWidget(
                                                                hoverBuilder:
                                                                    (_, bool isHovered) =>
                                                                        Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: isHovered
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey,
                                                                ),
                                                              ),
                                                            ).onTap(() {
                                                              pageController.animateToPage(
                                                                  (currentPage +
                                                                          1) %
                                                                      portfolioItems
                                                                          .length,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .linearToEaseOut);
                                                            }),
                                                          )),
                                                      Positioned(
                                                          top: context.height /
                                                                  2 -
                                                              20,
                                                          left: 15,
                                                          child: Center(
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          12)
                                                                  .copyWith(
                                                                      left: 12),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4)),
                                                              child:
                                                                  HoverableWidget(
                                                                hoverBuilder:
                                                                    (_, bool isHovered) =>
                                                                        Icon(
                                                                  Icons
                                                                      .arrow_back_ios,
                                                                  color: isHovered
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey,
                                                                ),
                                                              ),
                                                            ).onTap(() {
                                                              pageController.animateToPage(
                                                                  (currentPage -
                                                                          1) %
                                                                      portfolioItems
                                                                          .length,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .linearToEaseOut);
                                                            }),
                                                          )),
                                                      Positioned(
                                                          bottom: 0,
                                                          right: 0,
                                                          left: 0,
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        20),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .black
                                                                  .withValues(
                                                                      alpha:
                                                                          .5),
                                                            ),
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <Widget>[
                                                                  Center(
                                                                    child: Text(
                                                                      portfolioItems[
                                                                              currentPage]
                                                                          .name,
                                                                      style: const TextStyle(
                                                                          fontFamily: Fonts
                                                                              .raleway,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.white),
                                                                    ).container(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 25)),
                                                                  ),
                                                                  Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: List<
                                                                              Widget>.generate(
                                                                          portfolioItems
                                                                              .length,
                                                                          (int index) => AnimatedContainer(
                                                                              margin: const EdgeInsets.symmetric(horizontal: 4),
                                                                              height: 15,
                                                                              width: 15,
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, color: index == currentPage ? context.primaryColor : context.primaryColor.withValues(alpha: .4)),
                                                                              duration: const Duration(milliseconds: 300))))
                                                                ]),
                                                          ))
                                                    ],
                                                  ),
                                                );
                                              }));
                                    });
                                  }),
                                  HoverableWidget(
                                    hoverBuilder: (_, bool isHovered) => Icon(
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
