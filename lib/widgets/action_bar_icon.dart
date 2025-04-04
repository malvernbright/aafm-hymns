import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/constants.dart';

class ActionBarIcon extends StatelessWidget {
  const ActionBarIcon({
    super.key,
    required this.index,
  });

  final String index;

  @override
  Widget build(BuildContext context) {
    return LineIcon(Hive.box(favourites).containsKey(index)
        ? LineIcons.heartAlt
        : LineIcons.heart);
    // return LineIcon(LineIcons.heart);
  }
}
