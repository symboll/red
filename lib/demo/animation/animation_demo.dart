import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome()
    );
  }
}


class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> 
  with TickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;
  Animation _animationColor;
  CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      // value: 32.0,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      vsync: this
    );

    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut
    );
    _animation = Tween(begin: 32.0, end: 100.0).animate(_curvedAnimation);
    _animationColor = ColorTween(begin: Colors.red, end: Colors.green).animate(_curvedAnimation);

    // _animationController.addListener(() {
    //   setState(() { });
    // });

    _animationController.addStatusListener((AnimationStatus status) { 
      print(status);
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     icon: Icon(Icons.favorite),
    //     // iconSize: _animationController.value,
    //     iconSize: _animation.value,
    //     color: _animationColor.value,
    //     onPressed: () {
    //       switch (_animationController.status) {
    //         case AnimationStatus.completed:
    //           _animationController.reverse();
    //           break;
    //         default: _animationController.forward();
    //       }
    //     }
    //   ),
    // );
    return Center(
      child: AnimatedHeart(
        animations:[
          _animation,
          _animationColor
        ],
        controller: _animationController
      ),
    );
  }
}


class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller
  }): super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: IconButton(
        icon: Icon(Icons.favorite),
        iconSize: animations[0].value,
        color: animations[1].value,
        onPressed: () {
          switch (controller.status) {
            case AnimationStatus.completed:
              controller.reverse();
              break;
            default: controller.forward();
          }
        }
      ),
    );
  }
}