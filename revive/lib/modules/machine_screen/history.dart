import 'package:custom_calender_picker/custom_calender_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}
class _HistoryState extends State<History> {
  List<DateTime> eachDateTime = [];
  DateTimeRange? rangeDateTime;

  void _showDate() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2024),
            lastDate: DateTime(2030),
            initialDate: DateTime.now())
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(189, 201, 215, 1),
        ),
        backgroundColor: Color.fromRGBO(189, 201, 215, 1),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(189, 201, 215, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _showDate();
              },
              child: Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                  color: Colors.green[500],
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
                    "Chose the date",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Revive",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
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
                            '${_dateTime.toString().substring(0, 10)}',
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
          ],
        ),
      ),
    );
  }
}
