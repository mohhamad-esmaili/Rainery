import 'package:flutter/material.dart';

SnackBar snackBarWidget(context, locationName) => SnackBar(
      content: Text(
        'Location changed to $locationName',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      dismissDirection: DismissDirection.horizontal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
