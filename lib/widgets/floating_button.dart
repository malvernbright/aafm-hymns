import 'package:aafm_hymns/data/blocs/accessibility/accessibility_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../data/blocs/counter/counter_bloc.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increment());
            },
            icon: LineIcon(
              LineIcons.plusCircle,
              color: Colors.green,
              size: 35,
            )),
        IconButton(
          onPressed: () {
            context.read<CounterBloc>().add(Decrement());
          },
          icon: LineIcon(
            LineIcons.minusCircle,
            color: Colors.pink,
            size: 35,
          ),
        ),
      ],
    );
  }
}
