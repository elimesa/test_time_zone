import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_time_zone/app/data/provider/time_zone_provider.dart';

import '../data/models/details_zone.dart';

class Details extends StatelessWidget {
  final DetailsZone timeZone;

  Details({required this.timeZone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Time Zone'),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(context);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DateTime: ${timeZone.dateTime}'),
            Text('Day of week: ${timeZone.dayOfWeek}'),
            Text('Date of year: ${timeZone.dayOfYear}'),
            Text('Week Number: ${timeZone.weekNumber}'),
            Text('Abbreviation: ${timeZone.abbreviation}'),
            Text('Unix Time: ${timeZone.unixTime}'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _showChangeTimeZoneDialog(context);
                },
                child: Text('Change Time Zone'))
          ],
        ),
      ),
    );
  }

  void _showChangeTimeZoneDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Change TimeZone'),
            content: Consumer<TimeZoneProvider>(
              builder: (context, provider, _) {
                return DropdownButton<String>(
                    items: provider.timeZones.map((String timeZone) {
                      return DropdownMenuItem<String>(
                          value: timeZone, child: Text(timeZone));
                    }).toList(),
                    onChanged: (String? newTimeZone) {
                      if (newTimeZone != null) {
                        provider.addTimeZone(newTimeZone);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }
                    });
              },
            ),
          );
        });
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              TextButton(
                  child: Text('Delete'),
                  onPressed: () {
                    Provider.of<TimeZoneProvider>(context, listen: false)
                        .removeTimeZone(timeZone.timeZone ?? '');
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
