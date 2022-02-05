import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

class UrlService {
  static Future launchUrl(String url) async {
    bool isValid = await canLaunch(url);
    if (isValid) {
      if (kIsWeb) {
        html.window.open(url, 'new tab');
      } else {
        launchUrl(url);
      }
    }
  }
}
