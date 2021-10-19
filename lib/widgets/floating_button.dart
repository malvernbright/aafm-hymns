import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HymnProvider>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                tooltip: 'Increase Font Size',
                icon: const Icon(Icons.add, size: 35, color: Colors.blueAccent),
                onPressed: () => provider.increaseFontSize()),
            IconButton(
                tooltip: 'Reduce Font Size',
                icon:
                    const Icon(Icons.remove, size: 35, color: Colors.redAccent),
                onPressed: () => provider.reduceFontSize()),
          ],
        );
      },
    );
  }
}
