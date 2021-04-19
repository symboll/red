import 'package:flutter/material.dart';


const Color _bgColor = Color.fromRGBO(3, 54, 255, 1.0);
const Color _color = Colors.white;


class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //   AspectRatio(
        //     aspectRatio: 16.0/9.0,
        //     child: Container(
        //       color: _bgColor
        //     ),
        //   )
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 200.0,
              maxWidth: 200.0
            ),
            child: Container(
              color: _bgColor
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // IconBadge( icon: Icons.pool,),
        // IconBadge(icon: Icons.beach_access,),
        // IconBadge(icon: Icons.airplanemode_active,),
        Stack(
          alignment: Alignment(-1.0,-1.0),
          children: [
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                alignment: Alignment(1.0,1.0),
                child: Icon(
                  Icons.ac_unit,
                  color: _color,
                  size: 32.0,
                ),
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            // SizedBox( height: 32.0, ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Container(
                child: Icon(
                  Icons.brightness_2,
                  color: _color,
                  size: 32.0,
                ),
                decoration: BoxDecoration(
                  color: _bgColor,
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      _bgColor
                    ]
                  )
                  // borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              right: 20.0,
              child: Icon(
                Icons.ac_unit, color: _color,size: 12.0,)
            )
          ],
        )
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconBadge(
          Icons.pool,
          size: 40.0,
          height: 80.0,
          width: 80.0,
          backgroundColor: Colors.green,
        ),
        IconBadge(Icons.beach_access,),
        IconBadge(Icons.airplanemode_active,),
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color color; 

  IconBadge(this.icon,{
    this.size = 32.0,
    this.height = 64.0,
    this.width = 64.0,
    this.backgroundColor = _bgColor,
    this.color = _color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size, 
        color: color
      ),
      height: height,
      width: width,
      color: backgroundColor
    );
  }
}