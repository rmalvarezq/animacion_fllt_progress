import 'package:flutter/material.dart';
import 'package:flutter_app_progress/pages/dataBackupInitial.dart';
import 'package:flutter_app_progress/pages/data_backup_could.dart';

const mainDataBackupColor = Color(0xFF5113AA);
const secondaryDataBackupColor = Color(0xFFBC53FA);
const backgroundColor = Color(0xFFfce7fe);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _progressAnimation;
  Animation<double> _cloudOutAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
    _progressAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.65),
    );
    _cloudOutAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.7, 0.85),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          DataBackupInitialPage(
            progressAnimation: _progressAnimation,
            onAnimationStarted: () {
              _animationController.forward();
            },
          ),
          DataBackupCloudPage(
            progressAnimation: _progressAnimation,
            cloudOutAnimation: _cloudOutAnimation,
          )
        ],
      ),
    );
  }
}
