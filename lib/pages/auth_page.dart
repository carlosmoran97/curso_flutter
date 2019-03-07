import 'package:flutter/material.dart';
import './products_page.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  bool _acceptTerms = false;
  String _email, _password;

  @override
  Widget build(BuildContext context) {

    final double _targetWidth = MediaQuery.of(context).size.width >= 768.0 ? 500 : MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            decoration: BoxDecoration(image: _buildDecorationImage()),
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: _targetWidth,
                  child: Column(children: <Widget>[
                  _buildEmailTextInput(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextInput(),
                  _buildSwitchListTile(),
                  RaisedButton(child: Text('Login'), onPressed: _submitForm),
                ]
              )
            )
          )
        )
      )
    );
  }

  DecorationImage _buildDecorationImage() {
    return DecorationImage(
        image: AssetImage('assets/img/background.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop));
  }

  Widget _buildEmailTextInput() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _buildPasswordTextInput() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _buildSwitchListTile() {
    return SwitchListTile(
      value: _acceptTerms,
      title: Text('Accept terms'),
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  void _submitForm() {
    print(_email);
    print(_password);
    Navigator.pushReplacementNamed(context, '/home');
  }
}
