import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test_lumut/controller/controller_todos.dart';
import 'package:test_lumut/models/model_todos.dart';
import 'package:test_lumut/screens/detail/detail.dart';

class Master extends StatefulWidget {
  const Master({Key? key, required this.isPotrait}) : super(key: key);
  final bool isPotrait;

  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  ControllerTodos controllerTodos = Get.put(ControllerTodos());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<ControllerTodos>(builder: (value) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: value.load
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: value.errorMesage != null
                      ? SizedBox(
                          height: height,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  value.errorMesage ?? "Error",
                                  textAlign: TextAlign.center,
                                ),
                                TextButton(
                                  onPressed: () {
                                    controllerTodos.getListTodos();
                                  },
                                  child: const Text("Reload"),
                                ),
                              ],
                            ),
                          ),
                        )
                      : value.listTodos == null || value.listTodos!.isEmpty
                          ? SizedBox(
                              height: height,
                              child: const Center(
                                child: Text("Tidak ada todos"),
                              ),
                            )
                          : Column(
                              children: [
                                for (var item in value.listTodos!)
                                  InkWell(
                                    onTap: () {
                                      controllerTodos.getDetailTodos(item.id!);
                                      if (widget.isPotrait == true) {
                                        Get.to(() => const Detail());
                                      }
                                    },
                                    child: widgetListTodo(item),
                                  )
                              ],
                            ),
                ),
        ),
      );
    });
  }
}

Widget widgetListTodo(ModelTodos data) {
  return Container(
    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
    color: Colors.white,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 15,
      ),
      Row(
        children: [
          const Text(
            "User ID : ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(data.userId.toString()),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        data.title ?? "Title",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          const Text(
            "Task Status : ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(data.completed! ? "Completed" : "Not Completed"),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Divider(
        height: 0,
      )
    ]),
  );
}
