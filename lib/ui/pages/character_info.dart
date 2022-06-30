// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CharacterInfo extends StatefulWidget {
  final id;
  final name;
  final status;
  final species;
  final gender;
  final image;
  const CharacterInfo({
    Key? key,
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.image,
  }) : super(key: key);

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    if (widget.status.length == 5) {
      color = Colors.green;
    } else if (widget.status.length > 5) {
      color = Colors.deepOrangeAccent;
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '${widget.name}',
            style: const TextStyle(
                fontSize: 35, color: Color.fromARGB(255, 46, 52, 53)),
          ),
          elevation: 0,
          backgroundColor: Colors.grey,
        ),
        backgroundColor: const Color.fromARGB(255, 46, 52, 53),
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: Image.network(widget.image).image,
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Name  -  ${widget.name}',
                style: const TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 138, 202, 204)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Gender  -  ${widget.gender}',
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 138, 202, 204)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Species  -  ${widget.species}',
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 138, 202, 204)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Status  -  ${widget.status}',
                style: TextStyle(fontSize: 20, color: color),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ) // CharactersOwnPage(widget: widget),
        );
  }
}
