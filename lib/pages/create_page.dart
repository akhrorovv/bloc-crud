import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo13/bloc/create_bloc.dart';
import 'package:ngdemo13/bloc/create_event.dart';
import 'package:ngdemo13/models/post_model.dart';
import 'package:ngdemo13/models/post_res_model.dart';

import '../services/http_service.dart';
import '../services/log_service.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late CreateBloc createBloc;

  // final TextEditingController titleController = TextEditingController();
  // final TextEditingController bodyController = TextEditingController();

  // createPost() async {
  //   String title = titleController.text.toString().trim();
  //   String body = bodyController.text.toString().trim();
  //   Post post = Post(userId: 1, title: title, body: body);
  //
  //   var response =
  //       await Network.POST(Network.API_POST_CREATE, Network.paramsCreate(post));
  //   LogService.d(response!);
  //   PostRes postRes = Network.parsePostRes(response);
  //   backToFinish();
  // }

  backToFinish() {
    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBloc = BlocProvider.of(context);
    // createBloc.add(CreatePostEvent(createBloc.title, body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Create Post"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: createBloc.titleController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: createBloc.bodyController,
              decoration: const InputDecoration(hintText: "Body"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  // createBloc.createPost();
                },
                child: const Text("Create"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
