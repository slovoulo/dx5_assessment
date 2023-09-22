// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GamesModel> _$gamesModelSerializer = new _$GamesModelSerializer();
Serializer<GamesResults> _$gamesResultsSerializer =
    new _$GamesResultsSerializer();

class _$GamesModelSerializer implements StructuredSerializer<GamesModel> {
  @override
  final Iterable<Type> types = const [GamesModel, _$GamesModel];
  @override
  final String wireName = 'GamesModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GamesModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GamesResults)])),
    ];

    return result;
  }

  @override
  GamesModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GamesModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GamesResults)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GamesResultsSerializer implements StructuredSerializer<GamesResults> {
  @override
  final Iterable<Type> types = const [GamesResults, _$GamesResults];
  @override
  final String wireName = 'GamesResults';

  @override
  Iterable<Object?> serialize(Serializers serializers, GamesResults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'genre',
      serializers.serialize(object.genre,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GamesResults deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GamesResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'genre':
          result.genre = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GamesModel extends GamesModel {
  @override
  final BuiltList<GamesResults> results;

  factory _$GamesModel([void Function(GamesModelBuilder)? updates]) =>
      (new GamesModelBuilder()..update(updates))._build();

  _$GamesModel._({required this.results}) : super._() {
    BuiltValueNullFieldError.checkNotNull(results, r'GamesModel', 'results');
  }

  @override
  GamesModel rebuild(void Function(GamesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GamesModelBuilder toBuilder() => new GamesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GamesModel && results == other.results;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, results.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GamesModel')..add('results', results))
        .toString();
  }
}

class GamesModelBuilder implements Builder<GamesModel, GamesModelBuilder> {
  _$GamesModel? _$v;

  ListBuilder<GamesResults>? _results;
  ListBuilder<GamesResults> get results =>
      _$this._results ??= new ListBuilder<GamesResults>();
  set results(ListBuilder<GamesResults>? results) => _$this._results = results;

  GamesModelBuilder();

  GamesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _results = $v.results.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GamesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GamesModel;
  }

  @override
  void update(void Function(GamesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GamesModel build() => _build();

  _$GamesModel _build() {
    _$GamesModel _$result;
    try {
      _$result = _$v ?? new _$GamesModel._(results: results.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GamesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GamesResults extends GamesResults {
  @override
  final int? id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String genre;

  factory _$GamesResults([void Function(GamesResultsBuilder)? updates]) =>
      (new GamesResultsBuilder()..update(updates))._build();

  _$GamesResults._(
      {this.id,
      required this.title,
      required this.description,
      required this.genre})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'GamesResults', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GamesResults', 'description');
    BuiltValueNullFieldError.checkNotNull(genre, r'GamesResults', 'genre');
  }

  @override
  GamesResults rebuild(void Function(GamesResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GamesResultsBuilder toBuilder() => new GamesResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GamesResults &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        genre == other.genre;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, genre.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GamesResults')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('genre', genre))
        .toString();
  }
}

class GamesResultsBuilder
    implements Builder<GamesResults, GamesResultsBuilder> {
  _$GamesResults? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _genre;
  String? get genre => _$this._genre;
  set genre(String? genre) => _$this._genre = genre;

  GamesResultsBuilder();

  GamesResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _genre = $v.genre;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GamesResults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GamesResults;
  }

  @override
  void update(void Function(GamesResultsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GamesResults build() => _build();

  _$GamesResults _build() {
    final _$result = _$v ??
        new _$GamesResults._(
            id: id,
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GamesResults', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GamesResults', 'description'),
            genre: BuiltValueNullFieldError.checkNotNull(
                genre, r'GamesResults', 'genre'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
