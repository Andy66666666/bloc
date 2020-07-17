import 'package:bloc_flutter/page/future/page.dart';
import 'package:bloc_flutter/page/main/bloc.dart';
import 'package:bloc_flutter/page/main/page.dart';
import 'package:flutter/material.dart';
import 'architecture/bloc_provider/bloc_provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: FuturePage(),
      home: BlocProvider<MainBloc>(bloc: MainBloc(), child: MainPage()),
    );
  }
}
