part of 'hymns_bloc.dart';

abstract class HymnsEvent extends Equatable {
  const HymnsEvent();
}

class LoadHymnsEvent extends HymnsEvent {
  final String searchText;

  const LoadHymnsEvent({required this.searchText});
  @override
  List<Object> get props => [searchText];
}
