import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

extension WidgetExtensions on Widget {
  Widget asLoading({required bool isLoading, Widget? child}) {
    return isLoading ? (child ?? const Center(child: CircularProgressIndicator())) : this;
  }

  Widget asEmpty({required bool isEmpty, Widget? emptyWidget}) {
    return isEmpty ? (emptyWidget ?? const Center(child: Text("No data available"))) : this;
  }

  Widget asShimmer({required bool isLoading, double? height, double? width, Color? color, EdgeInsetsGeometry? padding}) {
    return isLoading ? Shimmer(child: Container()) : this;
  }
}
