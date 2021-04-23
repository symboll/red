
import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  void _handleStepTapped (int index) {
    this.setState(() {
      _currentStep = index;
    });
  }
  void _handleStepCancel () {
    this.setState(() {
      _currentStep > 0 ? _currentStep -= 1: _currentStep = 0;
    });
  }
  void _handleStepContinue () {
    this.setState(() {
      _currentStep < 2 ? _currentStep += 1: _currentStep = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            Theme(
              data: ThemeData(
                primaryColor: Colors.green
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: _handleStepTapped,
                onStepCancel: _handleStepCancel,
                onStepContinue: _handleStepContinue,
                controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.start,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: onStepContinue, 
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
                            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            elevation: MaterialStateProperty.all<double>(0.0)
                          ),
                          child: Text('CONTINUE')
                        ),
                        SizedBox(width: 32.0,),
                        ElevatedButton(
                          onPressed: onStepCancel, 
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                            elevation: MaterialStateProperty.all<double>(0.0)
                          ),
                          child: Text('CANCEL')
                        )
                    ])
                  );
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first.'),
                    content: Text('xxxs sdasd sdad'),
                    isActive: _currentStep == 0,
                    
                  ),
                  Step(
                    title: Text('Choose plan'),
                    subtitle: Text('Choose your plan.'),
                    content: Text('xxxs sdasd sdad'),
                    isActive: _currentStep == 1
                  ),
                  Step(
                    title: Text('Confirm payment'),
                    subtitle: Text('Confrim your payment method.'),
                    content: Text('xxxs sdasd sdad'),
                    isActive: _currentStep == 2
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}