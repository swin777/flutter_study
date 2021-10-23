import 'package:flutter/material.dart';
import 'package:nested_nv/pages/signup_pages/choose_credentials_page.dart';
import 'package:nested_nv/pages/signup_pages/collect_personal_info_page.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'signup/personal_info',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case 'signup/personal_info':
            builder = (BuildContext _) => CollectPersonalInfoPage();
            break;
          case 'signup/choose_credentials':
            builder = (BuildContext _) => ChooseCredentialsPage(
                  onSignupCompleted: () => Navigator.pop(context),
                );
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
