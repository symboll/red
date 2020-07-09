import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // StackDemo()         // 一摞小部件
          // AspectRatioDemo()   // 宽高比
          ConstrainedBoxDemo()
        ],
      )
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints(        // 限制
        minHeight: 200.0,
        maxWidth: 200.0
      ),
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0)
      ),
    );
  }
}


class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 16.0/9.0,
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0)
      )
    );
  }
}

class StackDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        SizedBox(
          height: 300.0,
          width: 200.0,
          child: Container(
            alignment: Alignment(-1.0, 1.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0)
            )
          ),
        ),
        SizedBox(
          height: 100.0,
        ),
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              // borderRadius: BorderRadius.circular(8.0)
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0)
                ]
              )
            ),
            child: Icon(Icons.brightness_2, color: Colors.white,size: 32.0),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white,size: 32.0),
        ),
        Positioned(
          right: 60.0,
          top: 80.0,
          child: Icon(Icons.ac_unit, color: Colors.white,size: 22.0),
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  //构造方法
  IconBadge(this.icon, {
    this.size = 32.0
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0)
    );
  }
}
