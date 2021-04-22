import 'package:flutter/material.dart';
import 'dart:math' as math;

class DataBackupCloudPage extends StatelessWidget {
  final Animation<double> progressAnimation;
  final Animation<double> cloudOutAnimation;

  const DataBackupCloudPage(
      {Key key, this.progressAnimation, this.cloudOutAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge(
          [
            progressAnimation,
            cloudOutAnimation,
          ],
        ),
        builder: (context, snapshot) {
          final queryData = MediaQuery.of(context).size;
          final size = queryData.width * 0.5;
          final circleSize = size *
              math.pow((progressAnimation.value  + 1), 2);
          final topPosition = queryData.height * 0.45;
          final centerMargin = queryData.width - circleSize;
          final leftSize = size * 0.6 * (1 - progressAnimation.value);
          final rightSize = size * 0.7 * (1 - progressAnimation.value);
          final leftMargin = queryData.width / 2 - leftSize * 1.2;
          final rightMargin = queryData.width / 2 - rightSize * 1.2;
          final middleSize =
              queryData.width / 2 - size / 2 * (1 - progressAnimation.value);
          final topOutPosition = queryData.height ;
          return Positioned(
            left: 0,
            right: 0,
            top: topPosition - circleSize,
            height: circleSize,
            child: Stack(
              children: [
                Positioned(
                  height: leftSize / 2,
                  width: size * (1 - progressAnimation.value),
                  left: middleSize,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  height: leftSize,
                  width: leftSize,
                  left: leftMargin,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  height: rightSize,
                  width: rightSize,
                  right: rightMargin,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  height: circleSize,
                  width: circleSize,
                  bottom: 0,
                  left: centerMargin / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),

            // child: child,
          );
        });
  }
}
