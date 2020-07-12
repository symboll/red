import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TextFieldDemo()
              RegisterForm()
            ],
          ),
        )
      )
    );
  }
}

class RegisterForm extends StatefulWidget {
  // RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool _autovalidate = false;


  void _submitRegistForm () {
    if(registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      registerFormKey.currentState.validate();

      debugPrint('${username}, ${password}');

      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Regsitering...'))
      );
    }else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
  String _validatorUsername (value) {
    if(value.isEmpty) { return  'Username is required!'; }
    return null;
  }
  String _validatorPassword (value) {
    if(value.isEmpty) { return  'Password is required!'; }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: ''
            ),
            onSaved: (value) => username = value,
            validator: _validatorUsername,
            autovalidate: _autovalidate,
          ),
          TextFormField(
            obscureText: true,       // 小圆点
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: ''
            ),
            onSaved: (value) => password = value,
            validator: _validatorPassword,
            autovalidate: _autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              onPressed: _submitRegistForm
            ),
          )
        ],
      ),
    );
  }
}


class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  // TextFieldDemo({Key key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = 'hi';
    textEditingController.addListener(() { 
      debugPrint('input: ${textEditingController.text}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (value) => debugPrint(value),
      // onSubmitted: (value) => debugPrint(value),
      controller: textEditingController,
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: "Title",
        hintText: "Enter the post title.",
        border: OutlineInputBorder(),
        filled: true
      ),
    );
  }
}