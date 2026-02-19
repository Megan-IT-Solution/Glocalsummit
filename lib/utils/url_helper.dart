import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

void openUrl(String url) {
  html.window.open(url, '_blank');
}

Future<void> launchExternalUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
