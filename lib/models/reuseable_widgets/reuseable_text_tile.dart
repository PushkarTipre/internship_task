import 'package:flutter/material.dart';

class Reuseable_Text_Tile extends StatelessWidget {
  Reuseable_Text_Tile({super.key, required this.textTile});
  String textTile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: ListTile(
        title: Text(
          textTile,
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
