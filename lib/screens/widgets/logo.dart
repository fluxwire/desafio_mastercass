import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String image;
  const Logo({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 300,
        maxHeight: 150,
        minHeight: 75,
        minWidth: 150,
      ),
      height: 100,
      width: mediaQuery.width * 0.5,
      decoration: const BoxDecoration(
          //color: Colors.red,
          ),
      child: Image.asset(image),
    );
  }
}
