import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationHomeDemo(),
    );
  }
}

class AnimationHomeDemo extends StatefulWidget {
  @override
  _AnimationHomeDemoState createState() => _AnimationHomeDemoState();
}

class _AnimationHomeDemoState extends State<AnimationHomeDemo> 

  with TickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;
  Animation _animationColor;

  /**
   * 非线性动画
   */
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      // value: 32.0,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds:  1000),
      vsync: this
    ); 

    _curvedAnimation = CurvedAnimation(
      parent: _animationController, 
      curve: Curves.bounceInOut);    // 非线性曲 线

    _animation = Tween(
        begin: 32.0, end: 100.0
      ).animate(_curvedAnimation);

    _animationColor = ColorTween(
        begin: Colors.red, end: Colors.red[900],
      ).animate(_curvedAnimation);

    // _animationController.addListener(() {
    //   this.setState(() { });
    // });

    _animationController.addStatusListener((AnimationStatus status) {
      print('status: $status');
    });



  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: ActionChip(
    //     label: Text('${_animationController.value}'), 
    //     onPressed: () {
    //       _animationController.forward();
    //     }
    //   ),
    // ); 

    // return Center(
    //   child: IconButton(
    //     icon: Icon(Icons.favorite,),
    //     iconSize: _animation.value,
    //     color: _animationColor.value,
    //     onPressed: () {
    //       switch(_animationController.status) {
    //         case AnimationStatus.completed:
    //           _animationController.reverse();
    //           break;
    //         default: 
    //           _animationController.forward();
    //       }
    //     },
    //   )
    // );

    return Center(
      child: AnimatedHeart(
        animations: [
          _animation,
          _animationColor
        ],
        animationController: _animationController,
      ),
    );
  }
}


class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController animationController;

  AnimatedHeart({
    this.animations,
    this.animationController
  }): super(listenable: animationController);


   @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite,),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch(animationController.status) {
          case AnimationStatus.completed:
            animationController.reverse();
            break;
          default: 
            animationController.forward();
        }
      },
    );
  }
}