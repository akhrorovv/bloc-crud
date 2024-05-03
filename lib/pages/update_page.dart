import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ngdemo13/bloc/update_bloc.dart';
import 'package:ngdemo13/bloc/update_event.dart';
import 'package:ngdemo13/bloc/update_state.dart';
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

  UpdateBloc updateBloc = UpdateBloc();

  backToFinish() {
    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateBloc.titleController.text = widget.post.title!;
    updateBloc.bodyController.text = widget.post.body!;

    updateBloc.stream.listen((state) {
      if (state is UpdatedPostState) {
        LogService.d('UpdatedPostState is done');
        backToFinish();
      }
    });
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
                controller: updateBloc.titleController,
                decoration: const InputDecoration(hintText: "Title"),
              ),
              TextField(
                controller: updateBloc.bodyController,
                decoration: const InputDecoration(hintText: "Body"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    updateBloc.add(UpdatePostEvent(widget.post));
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
