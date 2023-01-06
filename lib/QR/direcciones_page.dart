import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/QR/widgets/scan_tiles.dart';
import 'package:provider/provider.dart';

import '../Providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ScanTiles(tipo: 'http',);
  }
}
