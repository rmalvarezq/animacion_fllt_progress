import 'package:flutter/material.dart';
import 'package:flutter_app_progress/pages/dataBackupInitial.dart';

const mainDataBackupColor = Color(0xFF5113AA);
const secondaryDataBackupColor = Color(0xFFBC53FA);
const backgroundColor = Color(0xFFfce7fe);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          DataBackupInitialPage(),
        ],
      ),
    );
  }
}
