part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class HistoryFetch extends HistoryEvent {
  const HistoryFetch();
}

class HistoryScrolled extends HistoryEvent {
  const HistoryScrolled();
}
