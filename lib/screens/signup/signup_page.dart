

import 'package:ami_coding_pari_na/data/database_helper.dart';
import 'package:ami_coding_pari_na/models/user.dart';
import 'package:ami_coding_pari_na/screens/signup/signup_view.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> implements SignupPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  SignupPagePresenter _presenter;

  _SignupPageState() {
    _presenter = new SignupPagePresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doSignup(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Signup"),
      color: Colors.green,
    );
    var loginForm = new Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(20)),
        new Text(
          "Signup",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              )
            ],
          ),
        ),
        loginBtn,
        // SizedBox(height: 10),
        // InkWell(child: Text("New user?"'\tSignup here'),
        //   onTap: (){},
        // ),
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        toolbarHeight: 80,
        title: new Text("AMi CoDing PAri Na!", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    // Navigator.of(context).pushNamed("/login");
  }
}