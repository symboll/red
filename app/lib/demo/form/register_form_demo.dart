import 'package:flutter/material.dart';

class RegisterFormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
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
              RegisterForm()
            ],
          ),
        )
      )
    );
  }
}


class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool validatorValue;
  void _submitRegisterForm () {
    registerFormKey.currentState.save();
    validatorValue = registerFormKey.currentState.validate();
    debugPrint('username: $username, password: $password, validatorValue: $validatorValue');
    if(validatorValue) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Register...'),
        ),
      );
    }
  }

  String validatorUsername (value) {
    if(value.isEmpty) {
      return 'username is Required!';
    }
    return null;
  }

  String validatorPassword (value) {
    if(value.isEmpty) {
      return 'password is Required!';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration( 
              labelText: 'username:', 
              helperText: ''
            ),
            onSaved: (value) => username = value,
            validator: validatorUsername,
            autovalidateMode:  AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'password:', 
              helperText: ''
            ),
            onSaved: (value) => password = value,
            validator: validatorPassword,
            autovalidateMode:  AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 16.0,),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitRegisterForm,
              // color: Theme.of(context).accentColor,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor,)
                // backgroundColor: MaterialStateProperty.resolveWith(
                //   (states) => Theme.of(context).accentColor
                // )
              ),
              child: Text('Register',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              // elevation: 0.0,
            ),
          )
        ],
      )
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final _textEditingController = TextEditingController();
  final _textEditingValue = TextEditingValue(text: 'hi');
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textEditingController.value = _textEditingValue;
    _textEditingController.addListener(() { 
        debugPrint('inout->, ${ _textEditingController.value.text }');
    });
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      // onChanged: (value) =>  debugPrint('value : $value')},
      // onSubmitted: (value) => debugPrint('onSubmitted value : $value'),
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title: ',
        hintText: 'Enter the post title',
        border: OutlineInputBorder(),
        // filled: true
      ),
    );
  }
}
