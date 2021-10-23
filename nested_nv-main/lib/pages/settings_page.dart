import 'package:flutter/material.dart';
import 'package:nested_nv/pages/settings_pages/adv_settings_page.dart';
import 'package:nested_nv/pages/settings_pages/basic_settings_page.dart';
import 'package:nested_nv/pages/settings_pages/super_adv_settings_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final navigatorKey = GlobalKey<NavigatorState>();

  void gotoAdvSettingsPage() {
    navigatorKey.currentState!.pushNamed('settings/adv_settings');
  }

  void gotoSuperAdvSettingsPage() {
    navigatorKey.currentState!.pushNamed('settings/super_adv_settings');
  }

  Future<void> finishedSettings() async {
    final done = await isSettingsDone();
    if (done) {
      Navigator.pop(context);
    }
  }

  Future<bool> isSettingsDone() async {
    return await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Done settings?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case 'settings/basic_settings':
        page = BasicSettingsPage(gotoAdvSettingsPage: gotoAdvSettingsPage);
        break;
      case 'settings/adv_settings':
        page =
            AdvSettingsPage(gotoSuperAdvSettingsPage: gotoSuperAdvSettingsPage);
        break;
      case 'settings/super_adv_settings':
        page = SuperAdvSettingsPage(finishedSettings: finishedSettings);
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: finishedSettings,
        ),
      ),
      body: Navigator(
        key: navigatorKey,
        initialRoute: 'settings/basic_settings',
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}
