import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerToggle extends StatelessWidget {
  final double? borderRadius;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const ShimmerToggle({super.key,
    this.borderRadius,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      child: GestureDetector(
        //todo
        // onTap: onPressed ?? () => context.showWaitToast(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(3),
          ),
          width: width ?? 42,
          height: height ?? 21,
          padding: const EdgeInsets.all(2),
        ),
      ),
    );
  }
}
