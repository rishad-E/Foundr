import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectProfile extends StatelessWidget {
  const ShimmerEffectProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: 150,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          );
        },
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
      ),
    );
  }
}
