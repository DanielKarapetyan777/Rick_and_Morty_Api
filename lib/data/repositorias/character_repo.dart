import 'package:flutter/foundation.dart';
import 'package:flutter_application_5/data/models/character.dart';
import 'package:dio/dio.dart';

class CharacterRepo {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter(int page, String name) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(url + '?page=$page&name=$name');
      debugPrint(response.toString());
      var jsonReaulte = (response.data);
      return Character.fromJson(jsonReaulte);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class CharacterInfo {
  final url = 'https://rickandmortyapi.com/api/character';

  CharacterInfo({result, id});

  Future<Character> getCharacter(int id) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(url + '$id');
      debugPrint(response.toString());
      var jsonReaulte = (response.data);
      return Character.fromJson(jsonReaulte);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
