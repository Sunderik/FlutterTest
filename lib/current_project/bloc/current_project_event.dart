import 'package:equatable/equatable.dart';

abstract class CurrentProjectPageEvent extends Equatable {
  const CurrentProjectPageEvent();

  @override
  List<Object> get props => [];
}

// начало загрузки текущего проекта
class StartLoading extends CurrentProjectPageEvent {}

// при успешном выходе из системы
class ClearMainMenu extends CurrentProjectPageEvent {}
