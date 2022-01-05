// import 'dart:async';

// import 'package:flutter/material.dart';

// class CarouselCaption extends StatelessWidget {
//   /// Add custom widget at `title`'s position
//   final Widget title;

//   ///Add custom widget at `subTitle`'s position
//   final Widget subTitle;

//   /// List of widget type
//   final List<Widget>? actions;
//   const CarouselCaption(
//       {Key? key,
//       required this.title,
//       this.subTitle = const SizedBox(),
//       this.actions})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           title,
//           subTitle,
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: actions ?? [],
//           ),
//         ],
//       ),
//     );
//   }
// }

// ///  Add a new Slide or item to [CarouselSlider]
// class CarouselItem extends StatelessWidget {
//   final double height;

//   /// Add caption to the [CarouselSlider] by [LCarouseCaption]
//   final CarouselCaption caption;
//   final void Function()? onTap;

//   //Add Widget.
//   final Widget child;

//   const CarouselItem({
//     Key? key,
//     required this.height,
//     this.caption = const CarouselCaption(
//       title: SizedBox(),
//       subTitle: SizedBox(),
//     ),
//     this.onTap,
//     required this.child,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final carousel = CarouselSlider.of(context);

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: height,
//         child: Stack(
//           children: <Widget>[
//             Positioned.fill(child: child),
//             (carousel?.withCaption ?? false)
//                 ? Positioned.fill(
//                     child: caption,
//                     bottom: (carousel?.showIndicator ?? false) ? 20.0 : 10.0,
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// const _maxPreviousPages = 1200000;

// /// A slideshow component for cycling through elements—images
// /// or slides of text—like a carousel.
// ///
// /// Adding in the previous and next controls.
// ///
// /// You can also add the indicators to the carousel, alongside the controls, too.
// class CarouselSlider extends StatefulWidget {
//   final double? height;
//   final double? width;
//   final bool autoScroll;
//   final Duration interval;
//   final bool withControls;
//   final bool canScroll;
//   final bool showIndicator;
//   final bool enableIndicatorTapControl;
//   final bool withCaption;
//   final List<CarouselItem> items;
//   final Duration duration;
//   final Curve curve;
//   final Widget Function(BuildContext context, int activeIndex)?
//       indicatorBuilder;

//   final Color? controlIconColor;
//   final Color? controlColor;
//   const CarouselSlider({
//     Key? key,
//     this.height,
//     this.width,
//     this.autoScroll = true,
//     this.interval = const Duration(seconds: 8),
//     this.duration = const Duration(milliseconds: 500),
//     this.curve = Curves.fastLinearToSlowEaseIn,
//     this.withControls = false,
//     this.canScroll = true,
//     this.showIndicator = false,
//     this.enableIndicatorTapControl = false,
//     this.withCaption = false,
//     this.items = const <CarouselItem>[],
//     this.indicatorBuilder,
//     this.controlIconColor,
//     this.controlColor,
//   }) : super(key: key);

//   @override
//   _CarouselSliderState createState() => _CarouselSliderState();

//   static CarouselSlider? of(BuildContext context) {
//     return context.findAncestorWidgetOfExactType<CarouselSlider>();
//   }
// }

// class _CarouselSliderState extends State<CarouselSlider> {
//   late Timer _timer;
//   late PageController _controller;
//   int _currentPageIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         PageController(initialPage: _maxPreviousPages, viewportFraction: 0.4);

//     if (widget.autoScroll) {
//       _timer = Timer.periodic(widget.interval, _initAutoRun);
//     }
//   }

//   _initAutoRun(Timer _) {
//     _controller.nextPage(
//       duration: widget.duration,
//       curve: widget.curve,
//     );
//   }

//   int? _getPage(int index) {
//     return (_controller.page?.floor() ?? 0) + (index - _currentPageIndex);
//   }

//   _gotoPage({required int pageNo, bool reset = false}) {
//     if (pageNo == _currentPageIndex) return;

//     final _fakepage = _getPage(pageNo);

//     if (reset) {
//       _timer.cancel();
//       setState(() {
//         _timer = Timer.periodic(widget.interval, _initAutoRun);
//       });
//     }

//     _controller.animateToPage(
//       _fakepage ?? 0,
//       duration: widget.duration,
//       curve: widget.curve,
//     );
//   }

//   _previousPage() {
//     _timer.cancel();
//     setState(() {
//       _timer = Timer.periodic(widget.interval, _initAutoRun);
//     });
//     _controller.previousPage(
//       duration: widget.duration,
//       curve: widget.curve,
//     );
//   }

//   _nextPage() {
//     _timer.cancel();
//     setState(() {
//       _timer = Timer.periodic(widget.interval, _initAutoRun);
//     });
//     _controller.nextPage(
//       duration: widget.duration,
//       curve: widget.curve,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.height,
//       width: widget.width,
//       child: Stack(
//         fit: StackFit.passthrough,
//         children: <Widget>[
//           Positioned.fill(
//             child: PageView.builder(
//               pageSnapping: true,
//               controller: _controller,
//               onPageChanged: (int page) {
//                 setState(() {
//                   _currentPageIndex = page % widget.items.length;
//                 });
//               },
//               physics: widget.canScroll
//                   ? const AlwaysScrollableScrollPhysics()
//                   : const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return widget.items[index % widget.items.length];
//               },
//             ),
//           ),
//           widget.withControls
//               ? Positioned(
//                   left: 0,
//                   bottom: 0,
//                   top: 0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.chevron_left),
//                       onPressed: _previousPage,
//                       iconSize: 26.0,
//                       color: widget.controlIconColor ?? Colors.white,
//                       highlightColor: widget.controlColor,
//                     ),
//                   ),
//                 )
//               : Container(),
//           widget.withControls
//               ? Positioned(
//                   right: 0,
//                   bottom: 0,
//                   top: 0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.chevron_right),
//                       onPressed: _nextPage,
//                       iconSize: 26.0,
//                       color: widget.controlIconColor ?? Colors.white,
//                       highlightColor: widget.controlColor,
//                     ),
//                   ),
//                 )
//               : Container(),
//           widget.showIndicator
//               ? Positioned(
//                   left: 0,
//                   right: 0,
//                   bottom: 0,
//                   child: widget.indicatorBuilder != null
//                       ? widget.indicatorBuilder!(
//                           context,
//                           _currentPageIndex,
//                         )
//                       : buildIndicator(),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }

//   Widget buildIndicator() {
//     final List<Widget> _ = [];
//     for (int i = 0; i < widget.items.length; i++) {
//       final indicator = InkWell(
//         onTap: widget.enableIndicatorTapControl
//             ? () => _gotoPage(pageNo: i, reset: true)
//             : null,
//         child: Container(
//           height: 3.0,
//           width: 100 / widget.items.length,
//           margin: EdgeInsets.symmetric(
//               vertical: widget.enableIndicatorTapControl ? 10.0 : 0.0),
//           color: i == _currentPageIndex ? Colors.white : Colors.grey,
//         ),
//       );

//       _.add(indicator);
//     }

//     return Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: 10.0,
//           vertical: widget.enableIndicatorTapControl ? 0.0 : 10.0),
//       child: Wrap(
//         children: _,
//         spacing: 4.0,
//         alignment: WrapAlignment.center,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _controller.dispose();
//     super.dispose();
//   }
// }
