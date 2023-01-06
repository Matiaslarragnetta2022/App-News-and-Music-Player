import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../../Providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: (() async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR );
        // final barcodeScanRes = 'https://fernando-herrera.com';
        // final barcodeScanRes = 'geo:45.287135,-75.920226';

        if ( barcodeScanRes == '-1' ) {
          return;
        }
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nuevoScan(barcodeScanRes);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
      }),
      child: Icon(Icons.filter_center_focus),
    );
  }
}
