import "dart:core";

class GameModel {
  final int id;
  final String title;
  final String description;
  final String genre;


  GameModel(
      this.id,
      this.title,
      this.description,
      this.genre,

      );


  @override
  int get hashCode => super.hashCode;
}

List<GameModel> Game = GamesData.map((e) => GameModel(

  e['id'] as int,
  e['title'] as String,
  e['description'] as String,
  e['genre'] as String,

)).toList();

var GamesData = [];