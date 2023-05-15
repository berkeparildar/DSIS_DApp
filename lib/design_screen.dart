﻿import 'dart:math';

import 'package:dsis_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dsis_app/contract_classes.dart';

class MyNewPage extends StatefulWidget {
  const MyNewPage({Key? key}) : super(key: key);

  @override
  _MyNewPageState createState() => _MyNewPageState();
}

EvaluationCriterion evaluationCriterion = EvaluationCriterion('quiz', 15, 90);
EvaluationCriterion evaluationCriterion1 = EvaluationCriterion('lab', 15, 70);
EvaluationCriterion evaluationCriterion2 =
    EvaluationCriterion('midterm', 30, 92);
EvaluationCriterion evaluationCriterion3 =
    EvaluationCriterion('midterm', 40, 97);
List<EvaluationCriterion> eval = [
  evaluationCriterion,
  evaluationCriterion1,
  evaluationCriterion2,
  evaluationCriterion3
];
Course course = Course('asd', 213, 'ad', 'asd', 7, 4, eval, '99', "AA");
Course course1 = Course('qwe', 213, 'ad', 'asd', 7, 4, eval, '99', "XX");
Course course2 = Course('zxcd', 213, 'ad', 'asd', 7, 4, eval, '99', "FF");
List<Course> courses = [course, course1];
double _height = courses.length * 75;

class _MyNewPageState extends State<MyNewPage> {
  String _selectedYear = '2021';
  String _selectedSemester = 'Fall';

  void _onHeightChanged(double newHeight) {
    setState(() {
      _height = newHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final borderColor = borderColors[random.nextInt(borderColors.length)];
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('My New Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OrangeBox(
                    width: screenWidth * 0.46,
                    height: screenHeight * 0.05,
                    child: Center(
                      child: DropdownButton<String>(
                        isExpanded: false,
                        focusColor: Theme.of(context).scaffoldBackgroundColor,
                        alignment: Alignment.center,
                        elevation: 0,
                        dropdownColor: const Color(0xFF1e1e2e),
                        borderRadius: BorderRadius.circular(4),
                        underline: const SizedBox(
                          width: 0,
                        ),
                        value: _selectedYear,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedYear = newValue!;
                          });
                        },
                        items: <String>['2020', '2021', '2022', '2023']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: SizedBox(
                                  width: screenWidth * 0.30,
                                  child: Text(value)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  OrangeBox(
                    width: screenWidth * 0.46,
                    height: screenHeight * 0.05,
                    child: Center(
                      child: DropdownButton<String>(
                        isExpanded: false,
                        focusColor: Theme.of(context).scaffoldBackgroundColor,
                        alignment: Alignment.center,
                        elevation: 0,
                        dropdownColor: const Color(0xFF1e1e2e),
                        borderRadius: BorderRadius.circular(4),
                        underline: const SizedBox(
                          width: 0,
                        ),
                        value: _selectedSemester,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSemester = newValue!;
                          });
                        },
                        items: <String>['Fall', 'Spring', 'Summer', 'Winter']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(
                                width: screenWidth * 0.30, child: Text(value)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              AnimatedContainer(
                duration: const Duration(microseconds: 200),
                width: screenWidth,
                height: _height,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(courses.length * 75 / 6),
                      border: Border.all(color: borderColor, width: 3),
                      color: const Color(0xFF1e1e2e)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(flex: 5, child: Text('Course Name')),
                            Expanded(flex: 2, child: Text('Grade')),
                            Expanded(flex: 3, child: Text('')),
                          ],
                        ),
                        Flexible(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: courses.length,
                            itemBuilder: (context, index) => CourseDetails(
                                onHeightChanged: _onHeightChanged,
                                course: courses[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

class CourseDetails extends StatefulWidget {
  final Course course;
  final Function(double) onHeightChanged;

  CourseDetails(
      {super.key, required this.course, required this.onHeightChanged});

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  bool _expanded = false;

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
      _height = _expanded
          ? _height += 275
          : _height -= 275; // Set the desired height here
    });
    widget.onHeightChanged(_height);
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final borderColor = borderColors[random.nextInt(borderColors.length)];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 5, child: Text(widget.course.name)),
            Expanded(flex: 2, child: Text(widget.course.letterGrade)),
            Expanded(
              flex: 3,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _toggleExpanded();
                  });
                },
                child: const Text('Details'),
              ),
            )
          ],
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(courses.length * 75 / 12),
              border: Border.all(color: borderColor, width: 3),
              color: const Color(0xFF313244)),
          child: Column(
            children: [
              if (_expanded)
                ...widget.course.evaluationCriteria.map(
                      (entry) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(entry.name),
                        Text(entry.grade.toString()),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 20),
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(courses.length * 75 / 12),
              border: Border.all(color: borderColor, width: 3),
              color: const Color(0xFF313244)),
          child: Column(
            children: [
              if (_expanded)
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Course Code'),
                        Text(widget.course.code),
                      ],
                    ),
                  ),
              if (_expanded)
                Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Credit'),
                    Text(widget.course.credit.toString()),
                  ],
                ),
              ),
              if (_expanded)
                 Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Instructor'),
                    Text(widget.course.code),
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
