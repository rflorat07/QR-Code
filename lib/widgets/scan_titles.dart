import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTitles extends StatelessWidget {
  final String tipo;
  const ScanTitles({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) =>
                  Provider.of<ScanListProvider>(context, listen: false)
                      .borrarScanPorId(scans[index].id!),
              child: ListTile(
                leading: Icon(
                    tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
                    color: Theme.of(context).primaryColor),
                title: Text(scans[index].valor),
                subtitle: Text(scans[index].id.toString()),
                trailing:
                    const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                onTap: () => canLaunchUrl(context, scans[index]),
              ),
            ));
  }
}
