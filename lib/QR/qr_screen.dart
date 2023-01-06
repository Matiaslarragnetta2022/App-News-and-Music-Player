import 'package:flutter/material.dart';
import 'package:music_player_app/Providers/scan_list_provider.dart';
import 'package:music_player_app/Providers/ui_provider.dart';
import 'package:music_player_app/QR/direcciones_page.dart';
import 'package:music_player_app/QR/mapas_page.dart';
import 'package:music_player_app/QR/widgets/custom_navigationbar.dart';
import 'package:music_player_app/QR/widgets/scan_button.dart';
import 'package:music_player_app/custom%20Drawer/custom_drawer.dart';
import 'package:provider/provider.dart';

class QrScreen extends StatelessWidget {
  static const String routeName = '/qr-screen';
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (() {
final scanListProvider =  Provider.of<ScanListProvider>(context, listen: false).borrarTodos();

          }), icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    //final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.getTodosLosScans().then((print));

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return const MapasPage();
      case 1:
      scanListProvider.cargarScanPorTipo('http');
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}
