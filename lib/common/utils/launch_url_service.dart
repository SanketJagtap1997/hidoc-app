import 'package:url_launcher/url_launcher.dart';

class LaunchURL {
  static Future<bool> openUrl(String strUrl) async {
    print("Launch");
    print(strUrl);
    var url = Uri.parse(strUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
      return true;
    } else {
      print("URL not launched");
      return false;
    }
  }
}
