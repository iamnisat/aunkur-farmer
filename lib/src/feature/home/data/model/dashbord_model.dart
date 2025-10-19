class DashbordModel {
  final int totalProject;
  final int totalFarmer;
  final int cpvCompleted;
  final int totalPendingCpv;

  DashbordModel({
    required this.totalProject,
    required this.totalFarmer,
    required this.cpvCompleted,
    required this.totalPendingCpv,
  });

  factory DashbordModel.fromLocalDB(Map<String, Object?> data) {
    return DashbordModel(
      totalProject: data['totalProject'] as int,
      totalFarmer: data['totalFarmer'] as int,
      cpvCompleted: data['cpvCompleted'] as int,
      totalPendingCpv: data['totalPendingCpv'] as int,
    );
  }
}