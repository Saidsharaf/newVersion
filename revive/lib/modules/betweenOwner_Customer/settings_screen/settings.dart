import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:revive/modules/betweenOwner_Customer/settings_screen/account.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(24),
      children: [
        Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child:CircleAvatar(
                              radius: 33.3,
                              backgroundImage:
                                  AssetImage("assets/images/prof1.jpeg"),
                            ),
                  ),
                Container(
                  padding: EdgeInsets.only(top: 35, left: 43),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.edit,
                    color: Colors.green,
                    size: 18,
                    ),
                  ),
                ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Said Sharaf',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SettingsGroup(
          title: 'General',
          children: [
            Account(),
            buildNotification(),
            buildLogout(),
          ],
        ),
        SizedBox(
          height: 32,
        ),
        SettingsGroup(
          title: 'FEEDBACK',
          children: [
            const SizedBox(
              height: 8,
            ),
            buildReportBug(context),
            buildSentFeedback(context),
          ],
        ),
      ],
    );
  }
}

Widget buildDarkMode() => SwitchSettingsTile(
      settingKey: 'key-dark-mode',
      title: 'Dark Mode',
      enabledLabel: 'Enabled',
      disabledLabel: 'Disabled',
      leading: Icon(
        Icons.dark_mode,
      ),
    );

Widget buildLogout() => SimpleSettingsTile(
      title: "Logout",
      leading: Icon(
        Icons.logout,
        color: Colors.blueAccent,
      ),
      subtitle: '',
      onTap: () {},
    );
Widget buildPassTem() => SimpleSettingsTile(
      title: "password",
      subtitle: '123',
      leading: Icon(
        Icons.lock_outline,
        color: Colors.blueAccent,
      ),
      onTap: () {},
    );
Widget buildUserTem() => SimpleSettingsTile(
      title: "UserName",
      subtitle: 'said sharaf',
      leading: Icon(
        Icons.person,
        color: Colors.green,
      ),
      onTap: () {},
    );
Widget buildLanTem() => SimpleSettingsTile(
      title: "Language",
      subtitle: 'En',
      leading: Icon(
        Icons.language,
        color: Color.fromARGB(255, 2, 160, 165),
      ),
      onTap: () {},
    );

Widget buildAccount() => SimpleSettingsTile(
      title: "Account Settings",
      subtitle: 'Privacy, Security, Language',
      leading: Icon(
        Icons.logout,
        color: Colors.green,
      ),
      child: Container(),
      onTap: () {},
    );
Widget buildNotification() => SimpleSettingsTile(
      title: "Notification",
      subtitle: 'Newsletter, App Update',
      leading: Icon(
        Icons.notifications,
        color: Colors.deepOrange[300],
      ),
      child: Container(),
      onTap: () {},
    );
Widget buildLanguage() => DropDownSettingsTile(
      title: 'Language',
      settingKey: '',
      selected: 1,
      values: <int, String>{
        1: 'English',
        2: 'Arabic',
      },
      onChange: (p0) {},
    );

Widget buildLocation({
  String? key,
  String? value,
}) =>
    TextInputSettingsTile(
      title: 'Location',
      settingKey: 'settingKey',
      initialValue: value!,
      onChange: (p0) {
        sharedPref.saveData(key: key, value: value);
      },
    );
Widget buildPassword() => TextInputSettingsTile(
      title: 'Password',
      settingKey: 'Password',
      obscureText: true,
      validator: (pass) =>
          pass != null && pass.length >= 6 ? null : 'enter 6 characters',
      onChange: (p0) {},
    );
Widget buildReportBug(context) => SimpleSettingsTile(
      title: 'Report A Bug',
      subtitle: '',
      leading: Icon(
        Icons.bug_report,
        color: Colors.teal,
      ),
      onTap: () {},
    );
Widget buildSentFeedback(context) => SimpleSettingsTile(
      title: 'Send Feedback',
      subtitle: '',
      leading: Icon(
        Icons.thumb_up,
        color: Colors.purple,
      ),
      onTap: () {},
    );
