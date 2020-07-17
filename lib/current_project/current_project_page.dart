import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/splash/splash.dart';
import 'bloc/current_project.dart';

class CurrentProjectPage extends StatefulWidget {
  @override
  _CurrentProjectPageState createState() => _CurrentProjectPageState();
}

class _CurrentProjectPageState extends State<CurrentProjectPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final AuthenticationBloc _authBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Текущий проект'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => {
              //закрываем меню перед переходом, чтобы небыло ошибок при отрисовки
              _authBloc.add(AuthenticationLoggedOut()),
            },
          ),
          // action button
          // overflow menu
        ],
      ),
//      drawer: AppDrawer(selectedPage: AvailablePages.currentProjectPage.index),
      body: BlocProvider<CurrentProjectPageBloc>(
        create: (context) {
          return CurrentProjectPageBloc()
            ..add(StartLoading()); //начинаем загрузку
        },
        child: BlocBuilder<CurrentProjectPageBloc, CurrentProjectState>(
          builder: (context, state) {
            if (state is CurrentProjectPageUninitialized) {
              return SplashPage();
            }
            if (state is CurrentProjectPageInitialized) {
              return Text('project');
            }
            if (state is CurrentProjectPageLoadingFailure) {
              return  Text('error');
                      }
            return  Text('loading');
          },
        ),
      ),
    );
  }
}
