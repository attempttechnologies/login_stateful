import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';
import '../mixins/validation_mixin.dart';


class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: this.formKey,
        child: Column(
          children: <Widget>[
            this.emailField(),
            this.passwordField(),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            this.submitButton(),
          ],
        ),
      ),
    );
  }

  TextFormField emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@examle.com',
      ),
      validator: this.validateEmail,
      onSaved: (value) {
        this.email = value;
      },
    );
  }

  TextFormField passwordField() {
    return TextFormField(
        //obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
        ),
        validator: this.validatePassword,
        onSaved: (value) {
          this.password = value;
        });
  }

  RaisedButton submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit!'),
      onPressed: () {
        if (this.formKey.currentState.validate()) {
          this.formKey.currentState.save();
          print('Time to post my ${this.email} and ${this.password} to my API');
        }
      },
    );
  }
}
