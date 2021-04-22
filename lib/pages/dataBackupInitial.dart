import 'package:flutter/material.dart';
import 'package:flutter_app_progress/pages/home.dart';

const _duration = Duration(milliseconds: 500);
enum DataBackupState {
  initial,
  start,
  end,
}

class DataBackupInitialPage extends StatefulWidget {
  final VoidCallback onAnimationStarted;
  final Animation<double> progressAnimation;

  const DataBackupInitialPage(
      {Key key, this.onAnimationStarted, this.progressAnimation})
      : super(key: key);

  @override
  _DataBackupInitialPageState createState() => _DataBackupInitialPageState();
}

class _DataBackupInitialPageState extends State<DataBackupInitialPage> {
  DataBackupState _currentState = DataBackupState.initial;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Cloud Storage',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            if (_currentState == DataBackupState.end)
              Expanded(
                flex: 2,
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 1.0, end: 1.0),
                  duration: _duration,
                  builder: (_, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Un momento por favor',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ProgressCounter(widget.progressAnimation),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            if (_currentState != DataBackupState.end)
              Expanded(
                flex: 2,
                child: TweenAnimationBuilder(
                  tween: Tween(
                      begin: 1.0,
                      end:
                          _currentState != DataBackupState.initial ? 0.0 : 1.0),
                  duration: _duration,
                  onEnd: () {
                    setState(() {
                      _currentState = DataBackupState.end;
                    });
                  },
                  builder: (_, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0.0, 50 * value),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        'last Backup: ',
                        style: TextStyle(color: mainDataBackupColor),
                      ),
                      Text(
                        '21 de enero 2021',
                        style: TextStyle(
                          color: mainDataBackupColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AnimatedSwitcher(
                duration: _duration,
                child: _currentState == DataBackupState.initial
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              // Colors.black
                              mainDataBackupColor,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _currentState = DataBackupState.start;
                            });
                            widget.onAnimationStarted();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Created Backup',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          child: Text(
                            'Cancel',
                            // style: TextStyle(color: mainDataBackupColor),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            // Navigator.pop(context);
                          });
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    ));
  }
}

class ProgressCounter extends AnimatedWidget {
  
  ProgressCounter(Animation<double> animation) : super(listenable: animation);
  double get value => (listenable as Animation).value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(value * 100).truncate().toString()}%',
    );
  }
}
