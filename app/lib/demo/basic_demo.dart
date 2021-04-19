import 'package:flutter/material.dart';


class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconDemo();
  }
}

final String url = 'https://resources.ninghao.net/images/childhood-in-a-picture.jpg';
class IconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.grey[100],
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            alignment: Alignment.topCenter,
            // repeat: ImageRepeat.repeatY
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(Icons.pool, size: 32.0, color: Colors.white),
              // color: Color.fromRGBO(3, 54, 255, 1.0),
              // padding: EdgeInsets.only(left: 24.0, right:8.0)
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                // border: Border(
                //   top: BorderSide(
                //     color: Colors.indigoAccent[100],
                //     width: 3.0,
                //     style: BorderStyle.solid
                //   )
                // )
                border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid
                ),
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(32.0)
                // )
                // borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 16.0),
                    color: Color.fromRGBO(16, 22, 188, .5),
                    blurRadius: 25.0,    // 阴影模糊
                    spreadRadius: -9.0    // 阴影扩展
                  )
                ],
                shape: BoxShape.circle,
                // gradient: RadialGradient(
                //   colors: [
                //     Color.fromRGBO(7, 102, 255, 1.0),
                //     Color.fromRGBO(3, 28, 128, 1.0)
                //   ]
                // ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
            )
          ],
        )
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'likanghua',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey
            )
          )
        ]
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0
  );
  final String _author = '李白';
  final String _title = '将进酒';
  @override
  Widget build(BuildContext context) {
    return Text(
      '《$_title》 -- $_author 君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来，烹羊宰牛且为乐，会须一饮三百杯。',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}