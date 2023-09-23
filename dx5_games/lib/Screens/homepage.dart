import 'dart:convert';

import 'package:dx5_games/DioServices/dioDeleteService.dart';
import 'package:dx5_games/models/videogames/gamesModel.dart';
import 'package:dx5_games/models/videogames/games_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../DioServices/dioFetchService.dart';
import '../constants.dart';

import '../helpers/checkConnectivity.dart';
import '../helpers/updateCreateDialog.dart';
import '../models/serializers/serializers.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBusy = true;
  @override
  void initState() {
    // TODO: implement initState
    fetchAllGames();
    _checkConnection();
    super.initState();
  }

  void _checkConnection() {
    ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
    connectionStatus.initialize();
    connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    String msg = hasConnection ? 'Back online' : 'You are offline';

    networkSnackBar(context, msg, hasConnection, 3);
    if(hasConnection){
      fetchAllGames();

    }
  }
  Future<GamesResults?> fetchAllGames() async {
    GamesResults? gamesResults;
    final response = await DioFetchService().fetchGames();

    try {
      gamesData.clear();

      for (var result in json.decode(json.encode(response.data))) {
        gamesResults =
            serializers.deserializeWith(GamesResults.serializer, result);

        gamesData.addAll([
          {

            "id": gamesResults!.id,
            "title": gamesResults.title,
            "description": gamesResults.description,
            "genre": gamesResults.genre,
          },
        ]);
        //
        game = gamesData.map((e) => GameModel(
          e['id'],
          e['title'],
          e['description'] as String,
          e['genre'],
        )).toList();
      }
    } catch (e) {
      gamesResults = null;
    }

    setState(() => isBusy = false);

    return gamesResults;
  }

  deleteGame({required int gameId})async{
   try {
      await DioDeleteService().deleteGame(gameId);
      Fluttertoast.showToast(msg: 'Delete successful');
      fetchAllGames();


   }catch(e){
     Fluttertoast.showToast(msg: 'Failed:An error occurred',backgroundColor: kDeleteColor);

   }
  }

  gamesContainer({required int id,required String title, required String description, required String genre}) {
    return Material(elevation: 10,borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(


          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width*0.75,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: kBoldBlackTextStyle(15),
                    ),
                  ),
                  Flexible(child: Text(description,textAlign: TextAlign.start,style: kDescriptionTextStyle(12))),
                  Flexible(child: Text(genre,textAlign: TextAlign.start,style: kDescriptionTextStyle(12),))


                ],
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
              Flexible(
                child: IconButton(onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                     return UpdateDialog(id: id, title: title,description: description,genre: genre, isUpdating: true,);
                    },
                  ).then((value) => fetchAllGames());
                }, icon: Icon( Icons.edit,color:kPrimaryColor ,),
            ),
              ),              Flexible(
                child: IconButton(onPressed: (){
                  deleteGame(gameId: id);
                }, icon:const Icon( Icons.delete,color: kDeleteColor,),
                ),
              )],)
          ],
        ),
      ),
    );
  }

  fetchingGames() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SpinKitChasingDots(
            color: kPrimaryColor, duration: const Duration(seconds: 1), size: 35),
        const Text("Fetching games")
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return UpdateDialog(id: 0, title: "",description: "",genre: "", isUpdating: false,);
            },
          ).then((value) => fetchAllGames());
        },
          child: const Icon(Icons.add),

        ),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            title: const Text("Video Games"),
          ),
          body:
          Visibility(
            visible: isBusy ? false : true,
            replacement: fetchingGames(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height:12);
                },
                itemCount: game.length,
                itemBuilder: (context, index) {
                  return gamesContainer(title:game[index].title, description:game[index].description, genre: game[index].genre, id: game[index].id!);
                },
              ),
            ),)),
    );


  }
}