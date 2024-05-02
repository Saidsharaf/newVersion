import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:revive/modules/betweenOwner_Customer/settings_screen/settings.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Account Settings",
      subtitle: 'Privacy, Security, Language',
      leading: Icon(
        Icons.person,
        color: Colors.green,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: 'Privacy',
              children: [
                buildUserTem(),
                buildPassTem(),
                buildLanTem(),
              ],
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
