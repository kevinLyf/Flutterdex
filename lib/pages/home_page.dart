import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/pages/pokemon_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> pokemons = [];

  Future<void> getPokemons() async {
    var response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10'));
    var jsonData = jsonDecode(response.body);
    Set<Pokemon> uniquePokemons = {};

    for (var eachData in jsonData['results']) {
      var url = eachData['url'];
      var res = await http.get(Uri.parse(url));
      var jsonPokemon = jsonDecode(res.body);

      int id = jsonPokemon['id'];
      List<String> types = [];
      Map<String, int> stats = {};
      Map<String, String> abilities = {};
    
      void addStats(String key, int value, Map<String, int> stat) {
        stats[key] = value;
      }

       void addAbilities(String name, String url, Map<String, String> ability) {
        ability[name] = url;
      }

      for (var eachPokemon in jsonPokemon['types']) {
        types.add(eachPokemon['type']['name']);
      }

      for (var eachPokemon in jsonPokemon['abilities']) {
        addAbilities(eachPokemon['ability']['name'], eachPokemon['ability']['url'], abilities);
      }

      for (var eachPokemon in jsonPokemon['stats']) {
        addStats(eachPokemon['stat']['name'], eachPokemon['base_stat'], stats);
      }

      print(abilities);

      var pokemon =
          Pokemon(id: id, name: eachData['name'], types: types, stats: stats, abilities: abilities);
      uniquePokemons.add(pokemon);
    }

    pokemons = uniquePokemons.toList();
  }

  @override
  Widget build(BuildContext context) {
    getPokemons();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getPokemons(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PokemonPage(
                          id: pokemons[index].id!,
                          name: pokemons[index].name!,
                          type: pokemons[index].types![0],
                          stats: pokemons[index].stats!,
                          abilities: pokemons[index].abilities!,
                        ),
                      ),
                    ),
                    child: PokemonCard(
                        id: pokemons[index].id!,
                        name: pokemons[index].name!,
                        type: pokemons[index].types![0]),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
