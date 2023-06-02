import 'package:fl_qrscanner/utils/utils.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import 'package:fl_qrscanner/providers/providers.dart';

class ScanBtn extends StatelessWidget {
  const ScanBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', "Cancel", false, ScanMode.QR);

        const barCodeScanRes = 'geo:9.982666,-84.025694';
        if (barCodeScanRes == '-1') return;
        final newScan = await scanListProvider.newScan(barCodeScanRes);
        scanListProvider.selectedScan = newScan;
        launchURL(context, newScan);
        // scanListProvider.newScan('geo:15.33,15.66');
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
