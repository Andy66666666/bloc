import 'dart:convert';

import 'package:bloc_flutter/app_base/apluspro_page.dart';
import 'package:bloc_flutter/architecture/bloc/bloc_widget.dart';
import 'package:bloc_flutter/architecture/network/net/requester.dart';
import 'package:bloc_flutter/architecture/utils/logger.dart';
import 'package:bloc_flutter/page/property_detail/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/19

class PropertyDetailPage extends APlusProPage<PropertyDetailBloc> {
  PropertyDetailPage(String title, PropertyDetailBloc bloc) : super(title, bloc);

  @override
  BlocState<BlocWidget<PropertyDetailBloc>> state() => _PropertyDetailState();
}

class _PropertyDetailState extends APlusState<PropertyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: streamBuilder<String>(
          stream: widget.bloc.requestStreamController.stream,
          completedView: (data) {
            return Text(data);
          },
        ),
      ),
    );
  }

  @override
  void prepare() {
    _networkInit();
    super.prepare();
  }

  _networkInit() {
    /// 定义一个拦截器
    Interceptor interceptor = InterceptorsWrapper(onRequest: (RequestOptions option) {
      /// 可统一制定请求日志
      logFormat('请求地址 => ${option.uri.toString()}'
          '\n  请求header => ${json.encode(option.headers)}'
          '\n  请求body => ${json.encode(option.data)}');
    }, onResponse: (Response response) {
      /// 可统一制定请求日志
      logFormat('响应 => ${response.data.toString()}');
    });

    /// 注册并注入拦截器
    Request.register([interceptor]);
    Request.logEnable();
  }

  @override
  viewDidLoad(callback) {
    widget.bloc.initData();
  }
}