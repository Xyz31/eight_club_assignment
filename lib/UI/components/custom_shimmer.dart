import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerWidget() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.grey[350],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
