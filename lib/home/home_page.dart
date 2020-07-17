import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/current_project/current_project_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('currProj'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<CurrentProjectPage>(
                      builder: (context) {
                        return BlocProvider.value(
                          value: BlocProvider.of<AuthenticationBloc>(context),
                          child: CurrentProjectPage(),
                        );
                      },
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text('logout'),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(AuthenticationLoggedOut());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
