import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_lumut/controller/controller_todos.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerTodos>(builder: (value) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: value.detailTodos == null
            ? const SizedBox(width: 0, height: 0)
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "User ID : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(value.detailTodos!.userId.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      value.detailTodos!.title ?? "Title",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Task Status : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(value.detailTodos!.completed!
                            ? "Completed"
                            : "Not Completed"),
                      ],
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
