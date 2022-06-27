import 'package:flutter/material.dart';
import 'package:flutter_application_5/ui/pages/character_info.dart';

import '../../data/models/character.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({
    Key? key,
    required this.curretResults,
  }) : super(key: key);

  final List<Results> curretResults;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.75,
          crossAxisCount: 2,
        ),
        itemBuilder: (_, index) {
          final result = curretResults[index];
          return Container(
            width: 200,
            color: Colors.grey,
            child: Column(children: [
              SizedBox(
                width: double.infinity,
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    result.image,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CharacterInfo(
                                  id: result.id,
                                  name: result.name,
                                  gender: result.gender,
                                  image: result.image,
                                  species: result.species,
                                  status: result.status,
                                )),
                      );
                    },
                    child: Text(
                      result.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 46, 52, 53),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}

class Id {
  int id;
  Id({required this.id});
}
