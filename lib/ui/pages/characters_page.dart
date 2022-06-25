import 'package:flutter/material.dart';
import 'package:flutter_application_5/bloc/character_bloc.dart';
import 'package:flutter_application_5/data/models/character.dart';
import 'package:flutter_application_5/ui/widgets/character_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late Character _currentCaracter;
  List<Results> _curretResults = [];
  //int _currentPage = 1;

  @override
  void initState() {
    if (_curretResults.isEmpty) {
      context
          .read<CharacterBloc>()
          .add(const CharacterEvent.fetch(page: 1, name: ''));
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
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
