import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revive/modules/machine_screen/history.dart';
import 'package:revive/shared/component/component.dart';

class SingleMachine extends StatelessWidget {
  const SingleMachine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Color.fromRGBO(255, 255, 255, 1),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Revive",
          style: TextStyle(
            fontFamily: "Title",
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/leave.png",
              ),
              fit: BoxFit.cover,
              opacity: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 250,
                // child: Image.asset("assets/images/machine.jpg",),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 3,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/back1.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.device_thermostat_outlined,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Degree",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Body",
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "20",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Body",
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Day",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Body",
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "13-02-2024",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Body",
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[400],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.co2,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Carbon",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Body",
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "15",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Body",
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.only(top: 40),
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3,
                    ),
                  ],
                  color: Color.fromARGB(255, 173, 145, 59),
                ),
                child: MaterialButton(
                  onPressed: () {
                    navigate(context, History());
                  },
                  child: Text(
                    "History",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Revive",
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
