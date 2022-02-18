import 'dart:developer';

// import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_lumut/models/model_todos.dart';

class ControllerTodos extends GetxController {
  bool load = true;
  String? errorMesage;
  List<ModelTodos>? listTodos = [];

  ModelTodos? detailTodos;

  getListTodos() async {
    errorMesage = null;
    load = true;
    update();
    try {
      var response = await Dio(
        BaseOptions(
          connectTimeout: 10000,
          sendTimeout: 10000,
          receiveTimeout: 10000,
          responseType: ResponseType.plain,
        ),
      ).get("https://jsonplaceholder.typicode.com/todos");

      if (response.statusCode == 200) {
        log(response.data);
        listTodos = modelTodosFromJson(response.data);
        load = false;
        update();
      }
    } on DioError catch (e) {
      log(e.message);
      errorMesage = e.message;
      load = false;
      update();
    }
    // ServicesDio.dioGet(
    //     url: "https://jsonplaceholder.typicode.com/todos",
    //     onLoad: (value) {
    //       log(value.toString());
    //       load = value;
    //       update();
    //     },
    //     onError: (value) {
    //       log(value.errorMessage!);
    //       errorMesage =
    //           value.errorCode.toString() + " | " + value.errorMessage!;
    //       update();
    //     },
    //     onGetData: (value) {
    //       log(value);
    //       listTodos = modelTodosFromJson(value);
    //       update();
    //     });
  }

  getDetailTodos(int idTodos) {
    detailTodos = listTodos!.firstWhere((element) => element.id == idTodos);
    update();
  }
}
