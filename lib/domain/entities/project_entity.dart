class ProjectEntity {
  String? companyName;
  String? projectName;
  String? deadlineDate;
  String? duration;
  String? status;
  int? progress;

  ProjectEntity(
      {this.projectName,
      this.companyName,
      this.deadlineDate,
      this.duration,
      this.status,
      this.progress});
}
