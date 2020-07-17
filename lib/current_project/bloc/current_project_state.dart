import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class CurrentProjectState extends Equatable {
  const CurrentProjectState();

  @override
  List<Object> get props => [];
}

// ожидание получение данных при открытии страницы
class CurrentProjectPageUninitialized extends CurrentProjectState {}

// успешная загрузка текущего проекта
class CurrentProjectPageInitialized extends CurrentProjectState {}

// ошибка загрузки текущего проекта
class CurrentProjectPageLoadingFailure extends CurrentProjectState {
  final Exception error;

  const CurrentProjectPageLoadingFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'MainMenuLoadingFailure { error: ${error.toString()} }';
}
