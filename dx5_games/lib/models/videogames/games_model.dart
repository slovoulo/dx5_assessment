import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'games_model.g.dart';

abstract class GamesModel
    implements Built<GamesModel, GamesModelBuilder> {
  BuiltList<GamesResults> get results;

  GamesModel._();

  factory GamesModel([updates(GamesModelBuilder b)]) =
  _$GamesModel;
  static Serializer<GamesModel> get serializer =>
      _$gamesModelSerializer;
}

abstract class GamesResults
    implements Built<GamesResults, GamesResultsBuilder> {

  int? get id;
  String get title;
  String get description;
  String get genre;



  GamesResults._();
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "genre": genre,

  };
  factory GamesResults([updates(GamesResultsBuilder b)]) =
  _$GamesResults;
  static Serializer<GamesResults> get serializer =>
      _$gamesResultsSerializer;
}