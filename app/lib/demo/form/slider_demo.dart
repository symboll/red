import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _silderValue = 0.0;

  void _handleSliderChange (double value) {
    this.setState(() {
      _silderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox'),
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.grey[600]
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('value: $_silderValue'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      sliderTheme:SliderThemeData(
                        // 滑条的高度
                        trackHeight: 1.0,
                        valueIndicatorTextStyle: TextStyle(
                          color: Colors.white
                        ),
                        // valueIndicatorShape: SliderComponentShape.noOverlay,
                        // 气泡颜色
                        valueIndicatorColor: Theme.of(context).accentColor.withOpacity(0.5)
                      )
                    ),
                    child: Slider(
                      value: _silderValue, 
                      onChanged: _handleSliderChange,
                      activeColor: Theme.of(context).accentColor,
                      inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                      min: 0.0,
                      max: 10.0,
                      divisions: 10,
                      label: '${_silderValue.toInt()}',
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}