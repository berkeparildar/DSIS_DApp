﻿import 'dart:math';

import 'package:flutter/material.dart';

import 'contract_classes.dart';
import 'home_screen.dart';

class MyNewPage extends StatefulWidget {
  @override
  State<MyNewPage> createState() => _MyNewPageState();
}

class _MyNewPageState extends State<MyNewPage> {
  late Student student;
  @override
  Widget build(BuildContext context) {
    student = ModalRoute.of(context)?.settings.arguments as Student;
    final random = Random();
    final borderColor = borderColors[random.nextInt(borderColors.length)];
    final dataTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 9.0,
        );
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Transcript'),
        ),
        body: ListView.builder(
          itemCount: student.terms.length,
          itemBuilder: (context, index) {
            final term = student.terms[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: screenWidth,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: borderColor),
                      child: Text(
                        '${term.year} - ${term.season}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Table(
                    columnWidths: const {
                      0: FractionColumnWidth(.19),
                      1: FractionColumnWidth(.35),
                      2: FractionColumnWidth(.15),
                      3: FractionColumnWidth(.2),
                      4: FractionColumnWidth(.13),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                                height: screenHeight * 0.05,
                                child: Text('Code')),
                          )),
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.05,
                                      child: Text('Course Name')))),
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.05,
                                      child: Text('ECTS')))),
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.05,
                                      child: Text('Grade')))),
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.05,
                                      child: Text('Point')))),
                        ],
                      ),
                      ...term.courses.map((course) {
                        return TableRow(
                          children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                        height: screenHeight * 0.06,
                                        child: Text(course.code)))),
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                        height: screenHeight * 0.06,
                                        child: Text(course.name)))),
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                        height: screenHeight * 0.06,
                                        child: Text('${course.credit}')))),
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                        height: screenHeight * 0.06,
                                        child: Text(course.letterGrade)))),
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                        height: screenHeight * 0.06,
                                        child: Text('12')))),
                          ],
                        );
                      }).toList(),
                      TableRow(
                        children: [
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.06,
                                      child: Text('DNO')))),
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.06,
                                      child: Text('2.87')))),
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.06,
                                      child: Text('30')))),
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.06,
                                      child: Text('Total')))),
                          TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                      height: screenHeight * 0.06,
                                      child: Text('86')))),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: SizedBox(
                                  height: screenHeight * 0.06,
                                  child: Text('GPA'))),
                          TableCell(
                              child: SizedBox(
                                  height: screenHeight * 0.06,
                                  child: Text('2.87'))),
                          TableCell(
                              child: SizedBox(
                                  height: screenHeight * 0.06,
                                  child: Text('30'))),
                          TableCell(
                              child: SizedBox(
                                  height: screenHeight * 0.06,
                                  child: Text('Grand Total'))),
                          TableCell(
                              child: SizedBox(
                                  height: screenHeight * 0.06,
                                  child: Text('86'))),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
