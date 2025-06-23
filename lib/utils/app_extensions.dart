import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

extension WidgetExtensions on Widget {
  Widget asLoading({required bool isLoading}) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : this;
  }

  Widget asShimmer({required bool isLoading, double? height, double? width, Color? color, EdgeInsetsGeometry? padding}) {
    return isLoading ? Shimmer(child: Container()) : this;
  }
}
