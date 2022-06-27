// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_5/ui/widgets/characters_own_page.dart';

class CharacterInfo extends StatefulWidget {
  final id;
  final name;
  final status;
  final species;
  final gender;
  final image;
  const CharacterInfo({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.image,
  });

  @override
  State<CharacterInfo> createState() => _CharacterInfoState(
      id: id,
      name: name,
      species: species,
      status: status,
      gender: gender,
      image: image);
}

class _CharacterInfoState extends State<CharacterInfo> {
  final id;
  final name;
  final status;
  final species;
  final gender;
  final image;
  _CharacterInfoState({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$name',
          style: const TextStyle(
              fontSize: 35, color: Color.fromARGB(255, 46, 52, 53)),
        ),
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: const Color.fromARGB(255, 46, 52, 53),
      body: CharactersOwnPage(
          image: image,
          name: name,
          gender: gender,
          status: status,
          species: species),
    );
  }
}






  // Widget build(BuildContext context) {
  //   final id = ModalRoute.of(context)?.settings.arguments;
  //   late Character _currentCaracter;
  //   List<Results> _curretResults = [];

  //   @override
  //   void initState() {
  //     if (_curretResults.isEmpty) {
  //       context.read<CharacterBloc>().add(CharacterEvent.info(id: id));
  //       super.initState();
  //     }
  //   }

  //   final state = context.watch<CharacterBloc>().state;
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: const Text(
  //         '',
  //         style:
  //             TextStyle(fontSize: 35, color: Color.fromARGB(255, 46, 52, 53)),
  //       ),
  //       elevation: 0,
  //       backgroundColor: Colors.grey,
  //     ),
  //     backgroundColor: const Color.fromARGB(255, 46, 52, 53),
  //     body: state.when(
  //       loading: () {
  //         return Center(
  //           child: Row(
  //             children: const [
  //               CircularProgressIndicator(strokeWidth: 2),
  //               SizedBox(width: 20),
  //               Text('Loading...')
  //             ],
  //           ),
  //         );
  //       },
  //       loaded: (characterLoaded) {
  //         _currentCaracter = characterLoaded;
  //         _curretResults = _currentCaracter.results;
  //         return _curretResults.isNotEmpty
  //             ? CharacterList(curretResults: _curretResults)
  //             : const SizedBox();
  //       },
  //       error: () => const Center(
  //         child: Text('Nathing found...'),
  //       ),
  //     ),
  //   );
  // }