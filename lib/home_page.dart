// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import './filter_options_colleges.dart';
import './filter_options_domain.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Center(
              child: Text(
                'Talks For All',
                style: TextStyle(fontSize: 36, color: Colors.blueAccent),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Education systems often lack enough resources to bridge the gap between academia and industry. Despite institutions calling industry experts for talks and panel discussions, students of those institutions often miss out on them due to a variety of reasons and have no way to come back to the discussion which had happened. Students from non-elite institutions lack even a platform to call such experts.\n\nProposed solution is an app which is a marketplace for guest lecture videos, panel discussions and other talks that happen at eminent colleges across all domains.               ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightBlueAccent),
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              FilterCollegeOptionsPage())),
                  child: Text(
                    "Filter Based on College",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          FilterDomainOptionsPage())),
              child: Text(
                "Filter Based on Domain",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ));
}
