import 'package:flutter/material.dart';
import 'package:ride_sharing/config/app_config.dart' as config;
import 'package:ride_sharing/view/available_drivers_viewmodel.dart';
import 'driver_details_card.dart';

String valueChoose = 'Location';
List listItem = [
  'Location',
  'Time',
  'Gender',
  'Rating',
];

Widget Body(AvailableDriversViewModel model) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Row(
            children: [
              Image.asset('assets/images/image_filter.png'),
              const SizedBox(
                width: 50.0,
              ),
              Text(
                'Filter by',
                style:
                    // TextStyle(fontSize: 22.0),
                    TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: config.ThemeColors.mainTextColor(1),
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              DropdownButton(
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 0,
                hint: const Text('Select'),
                value: valueChoose,
                items: listItem.map((valueItem) {
                  return DropdownMenuItem<String>(
                      value: valueItem, child: Text(valueItem));
                }).toList(),
                onChanged: (newValue) {
                  // setState(() {
                  //   valueChoose = newValue.toString();
                  // });
                },
              )
            ],
          ),
        ),
        ListView.builder(
          itemCount: model.availableDrivers.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (model.availableDrivers.isEmpty) {
              ///Return no riders available widget
              return Text(
                'No Riders available in your locality',
                style: Theme.of(context).textTheme.headline3,
              );
            } else {
              return DriverDetailsCard(
                driver: model.availableDrivers[index],
                rideId: model.currentRideId,
              );
            }
          },
        ),
      ],
    ),
  );
}
