import 'package:flutter/material.dart';
import '../model/post.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo({Key key}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep < 3 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('title A'),
                    subtitle: Text('subtitle A'),
                    content: Text('content A'),
                    isActive: _currentStep == 0
                  ),
                  Step(
                    title: Text('title B'),
                    subtitle: Text('subtitle B'),
                    content: Text('content B'),
                    isActive: _currentStep == 1
                  ),
                  Step(
                    title: Text('title C'),
                    subtitle: Text('subtitle C'),
                    content: Text('content C'),
                    isActive: _currentStep == 2
                  ),
                  Step(
                    title: Text('title D'),
                    subtitle: Text('subtitle D'),
                    content: Text('content D'),
                    isActive: _currentStep == 3
                  ),
                ]
              )
            )
          ],
        ),
      )
    );
  }
}