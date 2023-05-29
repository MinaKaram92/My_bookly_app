import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchGivenUrl(BuildContext context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      showSnack(context, 'Internal server error, please try again later');
    }
  } else {
    showSnack(context, 'Not Available');
  }
}

showSnack(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
