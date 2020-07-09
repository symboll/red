import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // color: Colors.grey[100], // 背景色
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://resources.ninghao.org/images/tornado.jpg'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeat
          fit: BoxFit.cover,       // 不留白 保持图片比例
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.hardLight
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            // padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 20.0),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              // border: Border(
              //   top:BorderSide(
              //     color: Colors.green[200],
              //     width: 12.0,
              //     style: BorderStyle.solid
              //   ),
              // )
              border: Border.all(
                color: Colors.green[200],
                width: 3.0,
                style: BorderStyle.solid
              ),
              // borderRadius: BorderRadius.circular(10.0),
              // borderRadius: BorderRadius.only(
              //   topLeft:Radius.circular(20.0)
              // ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 16.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 25.0,      // 模糊程度
                  spreadRadius:  -9.0   // 阴影扩散
                )
              ],
              shape: BoxShape.circle,
              // gradient: RadialGradient(   // 径向渐变
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(3, 28, 128, 1.0)
              //   ]
              // ),
            gradient: LinearGradient(   // 径向渐变
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

class RichTextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        text: 'likanghua',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100
        ),
        children: [
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.green
            )
          )
        ]
      )
    );
  }
}

class TextDemo extends StatelessWidget{
  final TextStyle _TextStyle = TextStyle(
    fontSize: 20.0
  );  
  final String _author = '李白';
  final String _title = '将进酒';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '《$_title》- $_author 君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。',
      textAlign: TextAlign.center,
      style: _TextStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}