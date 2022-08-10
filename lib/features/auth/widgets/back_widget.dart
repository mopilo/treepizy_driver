import 'package:flutter/material.dart';

class BackWidget extends StatelessWidget {
  final String title;

  const BackWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(Object context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 25,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
