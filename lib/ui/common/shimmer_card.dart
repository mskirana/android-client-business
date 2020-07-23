import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100.0,
      child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: ListTile(
              title: Container(height: 20, width: 100, color: Colors.white),
              subtitle: Container(height: 10, width: 50, color: Colors.white),
              trailing: Container(height: 10, width: 50, color: Colors.white))),
    );
  }
}
