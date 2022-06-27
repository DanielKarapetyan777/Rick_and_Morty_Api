// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CharactersOwnPage extends StatelessWidget {
  const CharactersOwnPage({
    Key? key,
    required this.image,
    required this.name,
    required this.gender,
    required this.status,
    required this.species,
  }) : super(key: key);

  final image;
  final name;
  final gender;
  final String status;
  final species;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    if (status.length == 5) {
      color = Colors.green;
    }
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: Image.network(image).image, fit: BoxFit.cover)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Name  -  $name',
            style: const TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 138, 202, 204)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Gender  -  $gender',
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 138, 202, 204)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Species  -  $species',
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 138, 202, 204)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Status  -  $status',
            style: TextStyle(fontSize: 20, color: color),
          ),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
