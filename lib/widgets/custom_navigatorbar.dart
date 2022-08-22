import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

class CustomeNavigatorBar extends StatelessWidget {
  const CustomeNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) => uiProvider.selectedMenuOpt = index,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
      ],
    );
  }
}
