import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:pokedex/utils/capitalize.dart';
import 'package:pokedex/utils/formater_id.dart';
import 'package:pokedex/utils/get_type.dart';

class PokemonPage extends StatefulWidget {
  final int? id;
  final String? name;
  final String? type;
  final Map? stats;
  final Map? abilities;

  PokemonPage({
    super.key,
    required this.id,
    required this.name,
    required this.type,
    required this.stats,
    required this.abilities,
  });

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  // Map<String, String> abilitiesInfo = {};

  // Future<void> getAbilitiesInfo() async {
  //   for (var eachAbility in widget.abilities!) {

  //     var response = await http.get(Uri.http(eachAbility['url']));
  //     var jsonData = jsonDecode(response.body);

  //     print(jsonData);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getType(widget.type!),
        elevation: 0,
      ),
      body: SafeArea(
        child: Hero(
          tag: widget.id!,
          child: Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                height: 220,
                padding: const EdgeInsets.all(10),
                color: getType(widget.type!),
                child: Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${widget.id!}.gif',
                  scale: 0.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          formaterId(widget.id!),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: getType(widget.type!).withOpacity(.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          capitalize(widget.name!),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: getType(widget.type!),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: getType(widget.type!),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        capitalize(widget.type!),
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'HP',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.stats!['hp'].toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Attack',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.stats!['attack'].toString(),
                      style: const TextStyle(
                          color: Colors.red,
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Defense',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.stats!['defense'].toString(),
                      style: const TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Speed',
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.stats!['speed'].toString(),
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
