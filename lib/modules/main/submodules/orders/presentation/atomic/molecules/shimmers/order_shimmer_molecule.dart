import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OrderShimmerMolecule extends StatelessWidget {
  const OrderShimmerMolecule();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            SizedBox(
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30.0,
                      width: 100.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 30.0,
                      width: 100.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 30.0,
                      width: 100.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 30.0,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
