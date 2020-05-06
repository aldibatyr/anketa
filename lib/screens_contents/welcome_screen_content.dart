import 'package:flutter/material.dart';
import 'package:anketa/screens/login_screen.dart';
import 'package:anketa/screens/register_screen.dart';
import 'package:anketa/widgets/large_button.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToRegister() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterScreen()));
    }

    void goToLogin() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }

    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          Image.asset('assets/images/logo.png'),
          Spacer(),
          Text(
            'Review your interactions with people',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 20.0,
          ),
          LargeButton(
            title: 'Create An Account',
            outlined: false,
            handleTap: goToRegister,
          ),
          SizedBox(
            height: 10.0,
          ),
          LargeButton(
            title: 'Login Now',
            outlined: true,
            handleTap: goToLogin,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
