import 'package:flutter/material.dart';


 
class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('SnackBar'),
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
              SnackBarButton()
            ],
          ),
        )
      ),
    );
  }
} 

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('Open SnackBar'),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Processing...'),
            action: SnackBarAction(
              label: 'Ok ', 
              onPressed: () {}
            ),
          )
        ); 
      }, 
    );
  }
}