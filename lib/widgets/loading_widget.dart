import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingWidget(double size) {
  return LoadingAnimationWidget.threeRotatingDots(color: Colors.indigoAccent, size: size);
}