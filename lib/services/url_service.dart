import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  static Future<void> launchUrl(String url) async {
    final bool isValid = await canLaunchUrl(Uri.parse(url));
    if (isValid) {
      if (kIsWeb) {
        html.window.open(url, 'new tab');
      } else {
        launchUrl(url);
      }
    }
  }
}
