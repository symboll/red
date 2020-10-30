
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16/9,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
          SizedBox(
            height: 16.0
          ),
          // ConstrainedBox 可以 给子部件设置一些限制 最大 / 小宽度，最 大 / 小高度
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight:  200.0,
              minHeight: 150.0
            ),
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          )
        ],
      )
    );
  }
}


class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Stack 可以设置 一摞小部件
    return Stack(
      alignment: Alignment(-1.0, -1.0),
      children: [
        // SizedBox 强制子部件有固定尺寸
        SizedBox(
          height: 300.0,
          width: 200.0,
          child: Container(
            alignment: Alignment(1.0, -1.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            )
          ),
        ),
        SizedBox(height: 32.0),
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              // borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                Color.fromRGBO(7, 102, 255, 1.0),
                Color.fromRGBO(3, 54, 255, 1.0),
              ])
            ),
            child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 24.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {
    this.size = 32.0
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0)
    );
  }
}