import 'package:flutter/material.dart';

class CardSong extends StatelessWidget {
  const CardSong(
      {super.key,
      required this.imageNetwork,
      required this.title,
      required this.artis});

  final String imageNetwork;
  final String title;
  final String artis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageNetwork,
            height: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                artis,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
