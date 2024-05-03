import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ngdemo13/models/post_model.dart';
import 'package:ngdemo13/models/post_res_model.dart';
import 'package:ngdemo13/services/http_service.dart';
import 'package:ngdemo13/services/log_service.dart';

class UpdatePage extends StatefulWidget {
  final Post post;

  const UpdatePage({super.key, required this.post});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  updatePost() async {
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();

    Post newPost = widget.post;
    newPost.title = title;
    newPost.body = body;

    var response = await Network.PUT(
        Network.API_POST_UPDATE + newPost.id.toString(),
        Network.paramsUpdate(newPost));
    LogService.d(response!);
    PostRes postRes = Network.parsePostRes(response);
    backToFinish();
  }

  backToFinish() {
    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.post.title!;
    bodyController.text = widget.post.body!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Update Post"),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: "Title"),
              ),
              TextField(
                controller: bodyController,
                decoration: const InputDecoration(hintText: "Body"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    updatePost();
                  },
                  child: const Text("Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
