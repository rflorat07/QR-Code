import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/utils/utils.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        /* const barcodeScanRes = 'https://fernando-herrera.com'; */

        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final nuevoScan =
            await scanListProvider.nuevoScan(barcodeScanRes);

        canLaunchUrl(context, nuevoScan);

      },
    );
  }
}
