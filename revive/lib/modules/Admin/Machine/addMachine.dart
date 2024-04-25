import 'package:flutter/material.dart';

class AddMahcine extends StatelessWidget {
  const AddMahcine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          "Add Mahcine",
          style:
              TextStyle(fontFamily: "title", fontSize: 22, color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 250,
            width: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  buildRow(
                    name: "Name : ",
                    initialValue: "weatherEarth",
                    submit: (value) {},
                  ),
                  buildRow(name: "Location : ", initialValue: "home"),
                  buildRow(name: "Type : ", initialValue: "Weather"),
                  SizedBox(height: 10),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "title",
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildRow(
      {@required String? name,
      String? initialValue,
      void Function(String)? submit}) {
    return Row(
      children: [
        Text(
          name!,
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Frank",
          ),
        ),
        Container(
          height: 50,
          width: 150,
          child: TextFormField(
            onFieldSubmitted: submit,
            initialValue: initialValue,
            cursorColor: Colors.grey,
            style: TextStyle(fontFamily: "Body"),
            decoration: InputDecoration(
              suffix: Icon(
                Icons.edit,
                size: 16,
                color: Colors.teal,
              ),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}
