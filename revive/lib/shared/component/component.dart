import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:revive/modules/Owner/machine_screen/single_machine.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/comment.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildIcon({
  @required Color? shadowColor,
  Color? color,
  @required IconData? icon,
  @required EdgeInsetsGeometry? padd,
}) {
  return Padding(
    padding: padd!,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor!,
            blurRadius: 14,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: CircleAvatar(
        child: Icon(icon!, color: Colors.white),
        backgroundColor: color,
      ),
    ),
  );
}

Widget buildCard(context) {
  return InkWell(
    onTap: () {
      navigate(context, SingleMachine());
    },
    child: Card(
      margin: EdgeInsets.all(
        10,
      ),
      child: Container(
        width: double.infinity,
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Type   :  ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Revive",
                        style: TextStyle(
                          fontFamily: "Body",
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Name :  ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "55sasp",
                        style: TextStyle(
                          fontFamily: "Body",
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 120,
                height: 160,
                child: Image.asset("assets/images/machine.jpg"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildCard1(context) {
  return InkWell(
    onTap: () {
      navigate(context, SingleMachine());
    },
    child: Stack(
      children: [
        Container(
          height: 220,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(38, 41, 37, 0.29),
                blurRadius: .5,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 160),
          height: 60,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 175, 140, 35),
          ),
          child: Center(
              child: Text(
            "Revive",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontFamily: "Reg",
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          height: 110,
          width: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.fromSize(
              size: Size.fromRadius(48),
              child: Image(
                image: AssetImage(
                  "assets/images/back1.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 35, left: 150),
            child: Column(
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 139, 110, 21),
                    fontFamily: "Body",
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "#6662sav",
                  style: TextStyle(
                    color: Color.fromARGB(255, 36, 28, 4),
                    fontFamily: "Body",
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (route) => false,
    );
void navigate(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );

Widget btnQuestions({
  String? txt,
  Function()? onPress,
  Color? color,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onPress,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(38, 41, 37, 0.29),
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              txt!,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: "Reg",
                color: Color.fromARGB(206, 76, 175, 79),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 16,
      )
    ],
  );
}

Widget btnkQuestions({
  String? txt,
  Function()? onPress,
  bool? Selected,
  void Function(bool)? onSelected,
  int? index,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onPress,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(38, 41, 37, 0.29),
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Center(
              child: ChoiceChip(
            label: Text(txt!),
            selected: Selected!,
            onSelected: onSelected,
            backgroundColor: Colors.grey[200],
            selectedColor:Colors.grey[200] ,
            side: BorderSide.none,
          )),
        ),
      ),
      SizedBox(
        height: 16,
      )
    ],
  );
}

Widget textBuild({
  TextEditingController? controller,
  void Function(String)? onChange,
  void Function(String)? onSubmit,
  String? Function(String?)? validate,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
    child: TextFormField(
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      controller: controller,
      cursorColor: Colors.white,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hoverColor: Colors.green,
          filled: true,
          fillColor: Colors.green,
          border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
      maxLines: 1,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Widget textBuild2({
  @required String? text,
  TextEditingController? controller,
  void Function(String)? onChange,
  void Function(String)? onSubmit,
  String? Function(String?)? validate,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
    child: TextFormField(
      onChanged: onChange,
    onFieldSubmitted: onSubmit,
    validator: validate,
    controller: controller,
      cursorColor: Colors.white,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hoverColor: Colors.green,
          filled: true,
          fillColor: Colors.green,
          label: Text(text!),
          border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
      maxLines: 1,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Widget buildDropDown() {
  return CSCPicker(
    layout: Layout.vertical,
    //flagState: CountryFlag.DISABLE,
    onCountryChanged: (country) {
      print(country);
    },
    onStateChanged: (state) {},
    onCityChanged: (city) {},
    /* countryDropdownLabel: "*Country",
          stateDropdownLabel: "*State",
          cityDropdownLabel: "*City",*/
    dropdownDialogRadius: 30,
    searchBarRadius: 30,
  );
}

void bottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 168,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(
                    Uri.parse("https://forms.gle/Ff7So2epLcENJ7NMA"),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(38, 41, 37, 0.29),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Order new machine",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: "Body",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// final Uri _url = Uri.parse('https://www.google.com');

// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }

void bottomEmail(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 450,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'forget your password ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '  Enter your email',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                defultFormField(
                    lable: "Email",
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    controller: null),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      bottomEmail2(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void bottomEmail2(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 450,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  Text(
                    'Verify message',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '  Enter the the number you received',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              defultFormField(
                  lable: "verify message",
                  prefix: Icons.verified,
                  type: TextInputType.phone,
                  controller: null),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SlideCountdown(
                  duration: const Duration(seconds: 60),
                  separatorType: SeparatorType.title,
                  slideDirection: SlideDirection.up,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget defultFormField({
  @required TextEditingController? controller,
  @required TextInputType? type,
  @required String? lable,
  String? msg,
  @required IconData? prefix,
  IconData? suffix,
  bool isScure = false,
  VoidCallback? iconPress,
  VoidCallback? onTap,
  void Function(String)? onChange,
  void Function(String)? onSumbmit,
}) =>
    Container(
      height: 85,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isScure,
        style: TextStyle(
          fontSize: 13,
        ),
        onTap: onTap,
        onFieldSubmitted: onSumbmit,
        onChanged: onChange,
        validator: (value) {
          if (value!.isEmpty) {
            return msg;
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: lable,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: iconPress,
                  icon: Icon(
                    suffix,
                  ))
              : null,
        ),
      ),
    );

Widget like() => LikeButton(
      size: 40,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color.fromARGB(255, 0, 204, 119),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          isLiked ? Icons.favorite : Icons.heart_broken,
          color: isLiked ? Color.fromARGB(255, 95, 173, 98) : Colors.grey,
          size: 27,
        );
      },
      likeCount: 0,
    );

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CommentPage(),
    transitionDuration: Duration(milliseconds: 800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
