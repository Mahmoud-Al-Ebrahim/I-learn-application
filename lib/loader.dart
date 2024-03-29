import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Helper/app_color.dart';
import 'edited_spinkit_three_bounce.dart';

class Loader extends StatelessWidget {
  Loader({
    Key? key,
    double? size,
    Color? color,
  })  : _widget = _TripperLoaderCircle(size: size, color: color, key: key),
        super(key: key);

  Loader.spinKitThreeBounce({
    Key? key,
    double? size,
    Color? color,
  })  : _widget = _TripperLoaderThreeBounce(size: size, color: color, key: key),
        super(key: key);

  Loader.spinKitThreeBounceEditing({
    Key? key,
    double? size,
    Color? color,
  })  : _widget = _TripperLoaderThreeBounceEditing(size: size, color: color, key: key),
        super(key: key);

  final Widget _widget;

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}

class _TripperLoaderCircle extends StatelessWidget {
  const _TripperLoaderCircle({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.primaryColor[50]!,
      size:  40,
    );
  }
}

class _TripperLoaderThreeBounce extends StatelessWidget {
  const _TripperLoaderThreeBounce({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: AppColors.primaryColor[50]!,
      size: 20
    );
  }
}

class _TripperLoaderThreeBounceEditing extends StatelessWidget {
  const _TripperLoaderThreeBounceEditing({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const EditedSpinKitThreeBounce(
      color:  Color(0xFFFFFFFF),
      size:  24.0,
    );
  }
}
