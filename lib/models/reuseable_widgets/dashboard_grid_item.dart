import 'package:flutter/material.dart';
import 'package:internship_task/models/dashboard.dart';

class Dashboard_Grid_Item extends StatelessWidget {
  const Dashboard_Grid_Item({super.key, required this.dashboard});
  final Dashboard dashboard;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.grey,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(colors: [
            dashboard.color.withOpacity(0.55),
            dashboard.color.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          dashboard.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
