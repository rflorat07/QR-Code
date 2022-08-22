import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_reader/models/scan_models.dart';

Future canLaunchUrl(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);
  if (scan.tipo == 'http') {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
