import 'package:flutter/material.dart';

Color getType(String type) {
  if (type == "water") {
    return Colors.lightBlue;
  } else if (type == "ice") {
    return Colors.blue;
  } else if (type == "fire") {
    return Colors.red;
  } else if (type == "electric") {
    return Colors.yellowAccent;
  } else if (type == "grass") {
    return Colors.green;
  } else if (type == "poison") {
    return Colors.indigo;
  } else if (type == "rock") {
    return Colors.brown;
  } else if (type == "ground") {
    return Colors.brown;
  } else if (type == "steel") {
    return Colors.teal;
  } else if (type == "fairy") {
    return Colors.pinkAccent;
  } else if (type == "bug") {
    return Colors.greenAccent;
  } else if (type == "normal") {
    return Colors.white38;
  } else if (type == "fighting") {
    return Colors.redAccent;
  } else if (type == "psychic") {
    return Colors.pink;
  } else if (type == "ghost") {
    return Colors.purpleAccent;
  } else if (type == "dark") {
    return Colors.black;
  } else if (type == "dragon") {
    return Colors.deepPurple;
  } else {
    return Colors.black;
  }
}
