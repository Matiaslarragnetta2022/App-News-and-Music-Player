import 'package:flutter/material.dart';
import 'package:music_player_app/QR/widgets/scan_tiles.dart';
import 'package:provider/provider.dart';

import '../Providers/scan_list_provider.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ScanTiles(tipo: 'geo',);
  }
}
