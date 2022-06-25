import 'package:flutter/material.dart';
import 'package:flutter_application_5/bloc/character_bloc.dart';
import 'package:flutter_application_5/data/repositorias/character_repo.dart';
import 'package:flutter_application_5/ui/pages/characters_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final repository = CharacterRepo();
  final repository1 = CharacterInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Rick and Morty',
          style:
              TextStyle(fontSize: 35, color: Color.fromARGB(255, 46, 52, 53)),
        ),
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: const Color.fromARGB(255, 46, 52, 53),
      body: BlocProvider(
        create: (context) => CharacterBloc(
            characterRepo: repository, characterInfo: repository1),
        child: const CharactersPage(),
      ),
    );
  }
}
