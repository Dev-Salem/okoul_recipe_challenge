import 'package:flutter/material.dart';

class RecipeCardWidget extends StatelessWidget {
  final String name;
  final String imageURL;
  final num rating;

  const RecipeCardWidget(
      {required this.name,
      required this.imageURL,
      required this.rating,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardHeight = size.height / 3.5;
    final cardWidth = size.width / 2.3;
    return Container(
      margin: const EdgeInsets.all(7),
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: cardHeight * 0.7,
            width: cardWidth,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                Text(
                  (rating * 5).toStringAsFixed(2),
                  style: const TextStyle(fontSize: 20),
                ),
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.favorite,
                  size: 25,
                ),
                const SizedBox(
                  width: 3,
                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: Text(
              name,
              style: const TextStyle(fontSize: 17, shadows: [
                BoxShadow(color: Colors.black, spreadRadius: 2, blurRadius: 10)
              ]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )),
        ],
      ),
    );
  }
}
