import 'package:aafm_hymns/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class ActionBarIcon extends StatelessWidget {
  const ActionBarIcon({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return LineIcon(Hive.box(favourites).containsKey(index)
        ? LineIcons.heartAlt
        : LineIcons.heart);
  }
}
