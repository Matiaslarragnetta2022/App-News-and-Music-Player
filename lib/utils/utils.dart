import 'package:flutter/material.dart';
import 'package:music_player_app/QR/mapa_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../music/model/scan_model.dart';

launchURL( BuildContext context, ScanModel scan  ) async {

  final url = scan.valor;

  if ( scan.tipo == 'http' ) {
    // Abrir el sitio web
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }

  } else {
    Navigator.pushNamed(context, MapaPage.routeName, arguments: scan );
  }

}