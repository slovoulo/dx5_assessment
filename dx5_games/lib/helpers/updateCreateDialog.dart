///User will be presented with this dialog when the want to update or create a game a game

import 'dart:convert';

import 'package:dx5_games/DioServices/dioPostService.dart';
import 'package:dx5_games/DioServices/dioUpdateService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';
import '../models/serializers/serializers.dart';
import '../models/videogames/games_model.dart';

class UpdateDialog extends StatefulWidget {
  int id;
  String title;
  String description;
  String genre;
  bool isUpdating;  ///This value is used to determine whether a user is creating or updating a game

  UpdateDialog(
      {Key? key,
      required this.id,
      required this.title,
      required this.genre,
      required this.description,
      required this.isUpdating})
      : super(key: key);

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController genreController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isSuccess = false;
  bool isBusy = true;
  String errorMessage = "";
  late bool isUpdating;

  @override
  void initState() {
    ///Initialize controllers with existing values to avoid empty updates
    isUpdating = widget.isUpdating;
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    genreController = TextEditingController(text: widget.genre);
    super.initState();
  }

  Future<GamesModel?> updateGame({
    String? gameTitle,
    String? description,
    String? genre,
  }) async {
    GamesModel? updateData;

    try {
      final request = GamesResults((b) => b
        ..id = widget.id
        ..title = gameTitle ?? widget.title
        ..description = description ?? widget.description
        ..genre = genre ?? widget.genre).toJson();

      final response = await DioPutService().updateGame(widget.id, request);

      updateData = serializers.deserializeWith(
          GamesModel.serializer, json.decode(response.toString()));
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'An error occurred', backgroundColor: kDeleteColor);
      updateData = null;
      debugPrint('error: $e');
    }

    setState(() {
      isBusy = false;
    });

    return updateData;
  }

  Future<GamesModel?> createGame({
    String? gameTitle,
    String? description,
    String? genre,
  }) async {
    GamesModel? createData;

    try {
      final request = GamesResults((b) => b
        ..title = gameTitle
        ..description = description
        ..genre = genre).toJson();

      final response = await DioPostService().createGame(request);

      createData = serializers.deserializeWith(
          GamesModel.serializer, json.decode(response.toString()));
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'An error occurred', backgroundColor: kDeleteColor);
      createData = null;
      debugPrint('error: $e');
    }

    setState(() {
      isBusy = false;
    });

    return createData;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: isUpdating ? const Text('Update Game') : const Text("Create Game"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            isUpdating
                ? TextField(
                    controller: titleController,
                    decoration: const InputDecoration(hintText: 'Game Title'),
                  )
                : TextFormField(
                    decoration: const InputDecoration(labelText: " Game Title"),
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty';
                      }
                      return null;
                    },
                  ),
            isUpdating
                ? TextField(
                    controller: descriptionController,
                    decoration:
                        const InputDecoration(hintText: 'Game Description'),
                  )
                : TextFormField(
                    decoration:
                        const InputDecoration(labelText: " Game Description"),
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Description cannot be empty';
                      }
                      return null;
                    },
                  ),
            isUpdating
                ? TextField(
                    controller: genreController,
                    decoration: const InputDecoration(hintText: 'Game Genre'),
                  )
                : TextFormField(
                    decoration: const InputDecoration(labelText: " Game Genre"),
                    controller: genreController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Genre cannot be empty';
                      }
                      return null;
                    },
                  ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (isUpdating) {
              updateGame(
                      gameTitle: titleController.text,
                      description: descriptionController.text,
                      genre: genreController.text)
                  .then((value) {
                setState(() {
                  Navigator.of(context).pop();
                });
              });
            } else {
              if (_formKey.currentState?.validate() == true) {
                createGame(
                        gameTitle: titleController.text,
                        description: descriptionController.text,
                        genre: genreController.text)
                    .then((value) {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                });
              }
            }
          },
          child: isUpdating ? const Text('Update ') : const Text("Create "),
        ),
      ],
    );
  }
}
