import 'package:bloc_flutter/bloc_provider/bloc_provider.dart';
import 'package:bloc_flutter/page/property/bloc.dart';
import 'package:bloc_flutter/page/property/page.dart';
import 'package:flutter/material.dart';
import '../base_bloc.dart';
import 'bloc.dart';

/// @description Provider方式的页面
///
/// @author 燕文强
///
/// @date 2020/7/14

abstract class Page<T extends BlocBase> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    T bloc = BlocProvider.of<T>(context);
    return createWidget(context, bloc);
  }

  Widget createWidget(BuildContext context, final T bloc);
}

class MainPage extends Page<MainBloc> {
  @override
  Widget createWidget(BuildContext context, MainBloc bloc) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<int>(
            stream: bloc.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('你点击了我: ${snapshot.data} 下');
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 80, right: 40),
        child: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            bloc.plus();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: PropertyPage(PropertyBloc()))));
          },
        ),
      ),
    );
  }
}
