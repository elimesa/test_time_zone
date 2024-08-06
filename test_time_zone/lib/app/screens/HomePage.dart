import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_time_zone/app/data/models/details_zone.dart';
import 'package:test_time_zone/app/data/provider/time_zone_provider.dart';
import 'package:test_time_zone/app/screens/Details.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Zone Selected'),
        actions: [
          Consumer<TimeZoneProvider>(
            builder: (context, provider, _) {
              return PopupMenuButton<String>(onSelected: (String timeZone) {
                provider.addTimeZone(timeZone);
              }, itemBuilder: (BuildContext context) {
                return provider.timeZones.map((String timeZone) {
                  return PopupMenuItem<String>(
                    value: timeZone,
                    child: Text(timeZone),
                  );
                }).toList();
              });
            },
          ),
        ],
      ),
      body: Consumer<TimeZoneProvider>(builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: provider.detailsTimeZones.length,
            itemBuilder: (context, index) {
              final timeZoneProvider = provider.detailsTimeZones[index];
              return ListTile(
                title: Text('Titulo: ${timeZoneProvider.timeZone}'),
                subtitle: Text('Subtitulo: ${timeZoneProvider.dateTime}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Details(timeZone: timeZoneProvider),
                      ));
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return _showDeleteConfirmation(context, provider, timeZoneProvider);
                        });
                  },
                ),
              );
            });
      }),
    );
  }

  AlertDialog _showDeleteConfirmation(BuildContext context, TimeZoneProvider provider, DetailsZone timeZoneProvider) {
      return AlertDialog(
      title: const Text('Alert'),
      content:
          const Text('Are you sure that you want to delete it'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            provider.removeTimeZone(
                timeZoneProvider.timeZone ?? '');
            Navigator.of(context).pop(true);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
