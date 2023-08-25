import 'package:flutter/material.dart';

class ContainerWiget extends StatelessWidget {
  const ContainerWiget(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.container});
  final double width;
  final double height;
  final Color color;
  final Widget container;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.8,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(),
          ),
          container
        ],
      ),
    );
  }
}
