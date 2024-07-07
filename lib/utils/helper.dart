import 'package:url_launcher/url_launcher.dart';

launchPhoneCall(String number) async {
  try {
    String url = 'tel:$number'; // Add "+91" to the phone number
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print(e.toString());
  }
}
