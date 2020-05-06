import 'package:anketa/widgets/large_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const _colors = [Color(0xFF7d7b82), Color(0xFF3e3d40)];

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _colors,
                    begin: Alignment(1.0, 1.0),
                    end: Alignment(-1.0, -1.0),
                  ),
                  boxShadow: kElevationToShadow[8],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RegistrationForm(),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password = '';
  bool _loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void setEmail(value) {
    _email = value;
  }

  void setPassword(value) {
    _password = value;
  }

  void createAccount() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _loading = true;
      });
      try {
        FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: _email, password: _password)).user;
      } catch (e) {

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Welcome',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 36.0,
            ),
          ),
          EmailInput(
            assignEmail: setEmail,
          ),
          SizedBox(
            height: 20.0,
          ),
          PasswordInput(
            assignPassword: setPassword,
          ),
          SizedBox(
            height: 20.0,
          ),
          LargeButton(
            title: 'Register',
            outlined: false,
            handleTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

              }
            },
          )
        ],
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  final Function assignPassword;
  const PasswordInput({Key key, this.assignPassword})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isObscured = true;
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _pass.dispose();
    _confirmPass.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextFormField(
            obscureText: isObscured,
            controller: _pass,
            decoration: InputDecoration(

              suffixIcon: isObscured
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      child: Icon(Icons.visibility),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      child: Icon(Icons.visibility_off),
                    ),
              labelText: 'Password',
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter password';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
            onSaved: (value) {
              widget.assignPassword(value);
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextFormField(
            controller: _confirmPass,
            obscureText: isObscured,
            decoration: InputDecoration(
              labelText: 'Repeat Password',
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please re-enter your password';
              }
              if (value != _pass.text) {
                return 'Passwords must match';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}

class EmailInput extends StatelessWidget {
  final Function assignEmail;

  const EmailInput({
    Key key,
    this.assignEmail,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter your email';
          } else if (!value.contains('@') || !value.contains('.')) {
            return 'Please enter valid email';
          }
          return null;
        },
        onSaved: (value) {
          assignEmail(value);
        },
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  final Function assignName;

  const NameInput({
    Key key,
    this.assignName,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          labelText: 'Full Name',
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (nameInput) {
          if (nameInput.isEmpty) {
            return 'Please input your name';
          }
          return null;
        },
        onSaved: (value) {
          assignName(value);
        },
      ),
    );
  }
}
