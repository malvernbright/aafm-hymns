import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/hymns_repository.dart';

part 'hymns_event.dart';
part 'hymns_state.dart';

class HymnsBloc extends Bloc<HymnsEvent, HymnsState> {
  final HymnsRepositoryImpl hymnsRepositoryImpl;
  HymnsBloc({required this.hymnsRepositoryImpl}) : super(HymnsInitial()) {
    on<LoadHymnsEvent>((event, emit) async {
      emit(HymnsInitial());
      try {
        final hymns = await hymnsRepositoryImpl.fetchHymns();
        emit(HymnsLoadedState(hymns: hymns));
      } catch (e) {
        emit(HymnsErrorState(error: e.toString()));
      }
    });
  }
}
