import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'current_project_event.dart';
import 'current_project_state.dart';

class CurrentProjectPageBloc
    extends Bloc<CurrentProjectPageEvent, CurrentProjectState> {
  CurrentProjectPageBloc() : super(CurrentProjectPageUninitialized());

  @override
  Stream<CurrentProjectState> mapEventToState(
    CurrentProjectPageEvent event,
  ) async* {
    if (event is StartLoading) {
      yield CurrentProjectPageInitialized();
    }

    if (event is ClearMainMenu) {
      yield CurrentProjectPageUninitialized();
    }
  }
}
