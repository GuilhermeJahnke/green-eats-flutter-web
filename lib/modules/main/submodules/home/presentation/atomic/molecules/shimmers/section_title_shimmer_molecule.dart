import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SectionTitleShimmerMolecule extends StatelessWidget {
  const SectionTitleShimmerMolecule();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Container(
              height: 16,
              width: 120,
              color: Colors.grey,
            ),
            const Spacer(),
            Container(
              height: 16,
              width: 60,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
