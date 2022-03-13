import './filter_local_list_page.dart';
import 'package:flutter/material.dart';

class FilterCollegeOptionsPage extends StatefulWidget {
  @override
  State<FilterCollegeOptionsPage> createState() =>
      _FilterCollegeOptionsPageState();
}

class _FilterCollegeOptionsPageState extends State<FilterCollegeOptionsPage> {
  List<String> collegesNamesList = [
    'IITB',
    'IITM',
    'IIT KGP',
  ];

  List<String> selectedColleges = [];

  void initState() {
    selectedColleges = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            mainAxisExtent: 40,
            mainAxisSpacing: 2,
          ),
          shrinkWrap: true,
          itemCount: collegesNamesList.length,
          itemBuilder: (BuildContext context, int index) {
            return FilterChip(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              // tileColor: Colors.red,
              backgroundColor: Colors.lightBlueAccent,
              label: Text(collegesNamesList[index]),
              onSelected: (bool) {
                selectedColleges.add(collegesNamesList[index]);
              },
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          FilterLocalListPage(selectedColleges)));
            },
            child: const Text('Submit'),
          ),
        ],
      );
}
