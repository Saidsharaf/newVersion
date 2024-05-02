import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SingleMachine extends StatefulWidget {
  @override
  State<SingleMachine> createState() => _SingleMachineState();
}

class _SingleMachineState extends State<SingleMachine> {
  dynamic date;
  dynamic dateDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Revive',
          style: TextStyle(
            fontFamily: "Title",
            fontSize: 25,
            color: Color.fromARGB(255, 68, 124, 70),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 6,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/machine_background_2.jpg',
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 25,
                right: 14,
                left: 14,
                bottom: 12,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      _showDate(context);
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: ' History of Your Machine !             ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Select The Day',
                            style: TextStyle(
                              color: Color.fromARGB(255, 42, 219, 116),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
            dateDay == null
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GasesItemList(
                      date: dateDay ?? '',
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _showDate(BuildContext context) async {
    date = await showDatePicker(
        context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2030),
        initialDate: DateTime.now());

    setState(() {
      dateDay = DateFormat('yyyy-MM-dd').format(date);
    });
  }
}

class GasesItemList extends StatelessWidget {
  final dynamic date;
  const GasesItemList({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        GaseItem(
          itemImage: 'assets/icons/calendar-svgrepo-com (2).svg',
          itemName: 'Day',
          itemValue: date,
          heightSVG: 55,
          weightSVG: 55,
          color: Color.fromARGB(255, 103, 202, 127),
        ),
        GaseItem(
          itemImage: 'assets/icons/co2-svgrepo-com.svg',
          itemName: 'Carbon Dioxide',
          itemValue: '20',
          color: Color.fromARGB(255, 103, 202, 127),
        ),
        GaseItem(
          itemImage: 'assets/icons/oxygen-svgrepo-com.svg',
          itemName: 'Oxygen',
          itemValue: '25',
          color: Color.fromARGB(255, 103, 202, 127),
        ),
        GaseItem(
          itemImage: 'assets/icons/thermometer-svgrepo-com.svg',
          itemName: 'Temperature',
          itemValue: '30',
          heightSVG: 55,
          weightSVG: 55,
          color: Color.fromARGB(255, 103, 202, 127),
        ),
        GaseItem(
          itemImage: 'assets/icons/snow-svgrepo-com.svg',
          itemName: 'Humidity',
          itemValue: '50',
          heightSVG: 55,
          weightSVG: 55,
          color: Color.fromARGB(255, 103, 202, 127),
        ),
      ],
    );
  }
}

class GaseItem extends StatelessWidget {
  final String itemImage;
  final String itemName;
  final String itemValue;
  final double? heightSVG;
  final double? weightSVG;
  final Color color;

  const GaseItem({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemValue,
    this.heightSVG,
    this.weightSVG,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Card(
        elevation: 7.5,
        child: SizedBox(
          height: 70,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: ListTile(
                selectedColor: color,
                leading: SvgPicture.asset(
                  itemImage,
                  height: heightSVG ?? 65,
                  width: weightSVG ?? 65,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  itemName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Text(
                  itemValue,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
