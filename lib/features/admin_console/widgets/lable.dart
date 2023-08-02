import 'package:flutter/material.dart';

class Lable extends StatelessWidget {
  const Lable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Название",
          style: TextStyle(fontSize: 32),
        ),
        CircleAvatar(
            backgroundColor: const Color.fromRGBO(67, 67, 244, 1),
            child: IconButton(color: Colors.white, onPressed: () {}, icon: const Icon(Icons.search))),
      ],
    );
  }
}
