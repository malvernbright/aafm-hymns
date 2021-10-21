import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return Column(
          children: const [
            Text('Payments'),
            Text('Payments'),
            Text('Payments'),
            Text('Payments'),
            Text('Payments'),
          ],
        );
      },
    );
  }
}
