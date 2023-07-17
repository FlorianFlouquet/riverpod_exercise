import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String descritpion;
  final String picture;

  const CustomCard(
      {super.key, required this.descritpion, required this.picture});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 2.0,
              spreadRadius: 2.0)
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image(
              image: NetworkImage(widget.picture),
              height: 80.0,
            ),
          ),
          Flexible(
            child: Text(
              widget.descritpion,
            ),
          ),
        ],
      ),
    );
  }
}
