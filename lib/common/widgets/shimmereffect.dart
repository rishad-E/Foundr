import 'package:flutter/material.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.grey[400],
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.grey[400],
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.grey[400],
          ),
          // Container(
          //   height: 100,
          //   width: double.infinity,
          //   color: Colors.grey[400],
          // )
        ],
      ),
    );
  }
}
