import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
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
                onPressed: () => provider.increaseFontSize(),
                icon: const LineIcon(
                  LineIcons.plusCircle,
                  color: Colors.green,
                  size: 35,
                )),
            IconButton(
                onPressed: () => provider.reduceFontSize(),
                icon: const LineIcon(
                  LineIcons.minusCircle,
                  color: Colors.pink,
                  size: 35,
                )),
          ],
        );
      },
    );
  }
}
