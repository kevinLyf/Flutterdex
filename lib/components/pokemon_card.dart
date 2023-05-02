import 'package:flutter/material.dart';
import 'package:pokedex/utils/capitalize.dart';
import 'package:pokedex/utils/formater_id.dart';
import 'package:pokedex/utils/get_type.dart';

class PokemonCard extends StatelessWidget {
  final int? id;
  final String? name;
  final String? type;

  PokemonCard({
    super.key,
    required this.id,
    required this.name,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: getType(type!), borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(5)),
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${id!}.gif',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      formaterId(id!),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      capitalize(name!),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      capitalize(type!),
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
