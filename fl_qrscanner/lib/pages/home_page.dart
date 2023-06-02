import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_qrscanner/pages/address_page.dart';
import 'package:fl_qrscanner/pages/maps_history.dart';
import 'package:fl_qrscanner/providers/providers.dart';
import 'package:fl_qrscanner/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);

                scanListProvider.deleteAllScans();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomeBody(),
      bottomNavigationBar: const CustomNavBar(),
      floatingActionButton: const ScanBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider = Provider.of<ScanListProvider>(context);

    switch (currentIndex) {
      case 0:
        scanListProvider.chargeScansByType("geo");
        return MapsScreen();
      case 1:
        scanListProvider.chargeScansByType("http");
        return AddressScreen();
      default:
        return MapsScreen();
    }
  }
}
