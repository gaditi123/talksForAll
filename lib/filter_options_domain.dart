// ignore_for_file: prefer_const_constructors

import './filter_domain_page.dart';
import 'package:flutter/material.dart';

class FilterDomainOptionsPage extends StatefulWidget {
  @override
  State<FilterDomainOptionsPage> createState() =>
      _FilterDomainOptionsPageState();
}

class _FilterDomainOptionsPageState extends State<FilterDomainOptionsPage> {
  List<String> domainsList = [
    'Future',
    'Impact',
    'Challenges',
    'Science',
    'Research',
    'CAT',
    'Preparation',
  ];

  List<String> selecteddomains = [];
  bool isSelected=false;

  void initState() {
    selecteddomains = [];
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
          itemCount: domainsList.length,
          itemBuilder: (BuildContext context, int index) {
            return FilterChip(
              selected: isSelected,
              avatar: isSelected ? Icon(Icons.check, color: (Colors.red)) : null,
              selectedColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              // tileColor: Colors.red,
              backgroundColor: Colors.lightBlueAccent,
              label: Text(domainsList[index]),
              onSelected: (bool selected) {
                selecteddomains.add(domainsList[index]);
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
                          FilterDomainPage(selecteddomains)));
            },
            child: const Text('Submit'),
          ),
        ],
      );
}
