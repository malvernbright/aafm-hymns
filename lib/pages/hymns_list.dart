import 'package:aafm_hymns/providers/hymn_provider.dart';
import 'package:aafm_hymns/services/service.dart';
import 'package:aafm_hymns/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../data/blocs/hymns/hymns_bloc.dart';
import '../data/repositories/hymns_repository.dart';

class HymnsList extends StatelessWidget {
  const HymnsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HymnsBloc(
          hymnsRepositoryImpl:
              RepositoryProvider.of<HymnsRepositoryImpl>(context)),
      child: Scaffold(
        body: SearchBarWidget(),
      ),
    );
  }
}
