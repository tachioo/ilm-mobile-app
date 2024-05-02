// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:flutter_testing/views/pages/TutorPages/create_session_view.dart';
import 'package:flutter_testing/views/pages/TutorPages/session_page_view.dart';
import 'package:flutter_testing/views/pages/on_tap_tutor_profile.dart';
import 'package:flutter_testing/views/pages/session_selection_view.dart';
import 'package:table_calendar/table_calendar.dart';

import 'utils.dart';

class TutorAvailabilityView extends StatefulWidget {
  @override
  _TutorAvailabilityViewState createState() => _TutorAvailabilityViewState();
}

class _TutorAvailabilityViewState extends State<TutorAvailabilityView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool isSessionSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor availability'),
        // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TableCalendar(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is currently selected.
                  // If this returns true, then `day` will be marked as selected.

                  // Using `isSameDay` is recommended to disregard
                  // the time-part of compared DateTime objects.
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      isSessionSelected = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SelectingSessionView()));
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              ),
            ),
            // const SizedBox(
            //   width: double.infinity,
            //   child: Text(
            //     'woi',
            //     textAlign: TextAlign.right,
            //   ),
            // ),
            // SizedBox(
            //   width: 200,
            //   child: TextButton(
            //     onPressed: isSessionSelected == true
            //         ? () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) =>
            //                         const CreateSessionView()));
            //           }
            //         : null,
            //     style: ButtonStyle(
            //       foregroundColor: MaterialStateProperty.resolveWith<Color>(
            //         (Set<MaterialState> states) {
            //           if (states.contains(MaterialState.disabled)) {
            //             return Colors.white;
            //           } else {
            //             return Colors.white;
            //           }
            //         },
            //       ),
            //       backgroundColor: MaterialStateProperty.resolveWith<Color>(
            //         (Set<MaterialState> states) {
            //           if (states.contains(MaterialState.disabled)) {
            //             return Colors.grey;
            //           } else {
            //             return Colors.black;
            //           }
            //         },
            //       ),
            //       // foregroundColor: MaterialStateProperty.all(Colors.white),
            //       // backgroundColor: MaterialStateProperty.all(Colors.black),
            //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       )),
            //     ),
            //     child: const Text(
            //       'Check Session',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
          ]),
    );
  }
}
