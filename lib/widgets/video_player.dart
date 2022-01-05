import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class VideoPlayer extends StatelessWidget {
  final String? url;
  const VideoPlayer({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void playVideo(String atUrl) {
    if (kIsWeb) {
      final v = html.window.document.getElementById('videoPlayer');
      if (v != null) {
        v.setInnerHtml('<source type="video/mp4" src="$atUrl">',
            validator: html.NodeValidatorBuilder()
              ..allowElement('source', attributes: ['src', 'type']));
        final a = html.window.document.getElementById('triggerVideoPlayer');
        if (a != null) {
          a.dispatchEvent(html.MouseEvent('click'));
        }
      }
    } else {}
  }
}
