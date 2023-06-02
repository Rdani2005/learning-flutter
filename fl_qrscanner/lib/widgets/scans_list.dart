import 'package:fl_qrscanner/providers/providers.dart';
import 'package:fl_qrscanner/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScansList extends StatelessWidget {
  final IconData icon;

  const ScansList({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteScanById(scans[i].id!);
              },
              child: ListTile(
                leading: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[i].value),
                subtitle: Text(scans[i].id.toString()),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () {
                  Provider.of<ScanListProvider>(context, listen: false)
                      .selectedScan = scans[i];
                  launchURL(context, scans[i]);
                },
              ),
            ));
  }
}
