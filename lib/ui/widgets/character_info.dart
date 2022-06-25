import 'package:flutter/material.dart';
import 'package:flutter_application_5/bloc/character_bloc.dart';
import 'package:flutter_application_5/data/models/character.dart';
import 'package:flutter_application_5/ui/widgets/character_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  late Character _currentCaracter;
  List<Results> _curretResults = [];
  //int _currentPage = 1;

  @override
  void initState() {
    if (_curretResults.isEmpty) {
      context.read<CharacterBloc>().add(const CharacterEvent.info(id: 1));
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;
    final state = context.watch<CharacterBloc>().state;
    return state.when(
      loading: () {
        return Center(
          child: Row(
            children: const [
              CircularProgressIndicator(strokeWidth: 2),
              SizedBox(width: 20),
              Text('Loading...')
            ],
          ),
        );
      },
      loaded: (characterLoaded) {
        _currentCaracter = characterLoaded;
        _curretResults = _currentCaracter.results;
        return _curretResults.isNotEmpty
            ? CharacterList(curretResults: _curretResults)
            : const SizedBox();
      },
      error: () => const Center(
        child: Text('Nathing found...'),
      ),
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