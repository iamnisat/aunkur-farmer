import 'package:intl/intl.dart';

class HomePageBarChartModel {
  final String title;
  final int value;

  HomePageBarChartModel({
    required this.title,
    required this.value,
  });

  factory HomePageBarChartModel.fromLocalDB(Map<String, Object?> data) {
    return HomePageBarChartModel(
      title: DateFormat('E').format(DateTime.parse(data['Date'] as String)) ,
      value: data['NumberOfRecords'] as int,
    );
  }
}
