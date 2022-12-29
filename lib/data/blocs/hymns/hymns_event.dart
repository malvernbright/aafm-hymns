part of 'hymns_bloc.dart';

abstract class HymnsEvent extends Equatable {
  const HymnsEvent();
}

class LoadHymnsEvent extends HymnsEvent {
  @override
  List<Object> get props => [];
}

class ChangedHymnsEvent extends HymnsEvent {
  final String changedString;

  const ChangedHymnsEvent({required this.changedString});
  @override
  List<Object> get props => [changedString];
}
