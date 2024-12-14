import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

class VideoPlayButton extends StatefulWidget {
  const VideoPlayButton({
    super.key,
  });

  @override
  State<VideoPlayButton> createState() => _VideoPlayButtonState();
}

class _VideoPlayButtonState extends State<VideoPlayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController scaleController;
  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
        hoverTransitionDuration: const Duration(milliseconds: 500),
        hoverBuilder: (BuildContext context, bool isHovered) {
          if (isHovered) {
            scaleController.forward().then((void value) {});
          } else {
            scaleController.reverse().then((void value) {});
          }
          return SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  )
                      .container(
                          padding: EdgeInsets.all(isHovered ? 30 : 18),
                          shouldAnimate: true)
                      .addDecoration(BoxDecoration(
                          shape: BoxShape.circle, color: context.primaryColor))
                      .container(
                          padding: EdgeInsets.all(isHovered ? 0 : 12),
                          shouldAnimate: true)
                      .addDecoration(BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.primaryColor.withValues(alpha: .3)))
                      .center(),
                ),
                Positioned.fill(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: FadeTransition(
                      opacity: Tween<double>(begin: 1.0, end: 0.0)
                          .animate(scaleController),
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 1.0, end: 20.0)
                            .animate(scaleController),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 32,
                        ),
                      )),
                ))
              ],
            ),
          );
        });
  }
}
