import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

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
        hoverBuilder: (context, isHovered) {
          if (isHovered) {
            scaleController.forward().then((value) {});
          } else {
            scaleController.reverse().then((value) {});
          }
          return SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              children: [
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
                          color: context.primaryColor.withOpacity(0.3)))
                      .center(),
                ),
                Positioned.fill(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: FadeTransition(
                      opacity:
                          Tween(begin: 1.0, end: 0.0).animate(scaleController),
                      child: ScaleTransition(
                        scale: Tween(begin: 1.0, end: 20.0)
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
