class STSSuitListModel {
  List<Rows> rows;
  int total;

  STSSuitListModel({this.rows, this.total});

  STSSuitListModel.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Rows {
  String sId;
  int sessionUserTrackingId;
  int assessmentId;
  int assessmentType;
  int userId;
  String fullName;
  int statusId;
  String completedOn;
  int score;
  int percentScore;
  double averageScoreOfClass;
  int completeAttempts;
  int timeSpent;
  int subjectId;
  int beginDate;
  int endDate;
  String title;
  int sessionId;
  String sessionName;
  int sessionGroupId;
  String sessionGroupName;
  int questionCount;
  bool showSubTitle;
  bool isOptionRandom;
  int duration;
  int createdBy;
  int createdOn;
  int modifiedBy;
  int modifiedOn;
  int deletedBy;
  int deletedOn;
  bool isDeleted;

  Rows(
      {this.sId,
        this.sessionUserTrackingId,
        this.assessmentId,
        this.assessmentType,
        this.userId,
        this.fullName,
        this.statusId,
        this.completedOn,
        this.score,
        this.percentScore,
        this.averageScoreOfClass,
        this.completeAttempts,
        this.timeSpent,
        this.subjectId,
        this.beginDate,
        this.endDate,
        this.title,
        this.sessionId,
        this.sessionName,
        this.sessionGroupId,
        this.sessionGroupName,
        this.questionCount,
        this.showSubTitle,
        this.isOptionRandom,
        this.duration,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.deletedBy,
        this.deletedOn,
        this.isDeleted});

  Rows.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sessionUserTrackingId = json['sessionUserTrackingId'];
    assessmentId = json['assessmentId'];
    assessmentType = json['assessmentType'];
    userId = json['userId'];
    fullName = json['fullName'];
    statusId = json['statusId'];
    completedOn = json['completedOn'];
    score = json['score'];
    percentScore = json['percentScore'];
    averageScoreOfClass = json['averageScoreOfClass'];
    completeAttempts = json['completeAttempts'];
    timeSpent = json['timeSpent'];
    subjectId = json['subjectId'];
    beginDate = json['beginDate'];
    endDate = json['endDate'];
    title = json['title'];
    sessionId = json['sessionId'];
    sessionName = json['sessionName'];
    sessionGroupId = json['sessionGroupId'];
    sessionGroupName = json['sessionGroupName'];
    questionCount = json['questionCount'];
    showSubTitle = json['showSubTitle'];
    isOptionRandom = json['isOptionRandom'];
    duration = json['duration'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    deletedBy = json['deletedBy'];
    deletedOn = json['deletedOn'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sessionUserTrackingId'] = this.sessionUserTrackingId;
    data['assessmentId'] = this.assessmentId;
    data['assessmentType'] = this.assessmentType;
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['statusId'] = this.statusId;
    data['completedOn'] = this.completedOn;
    data['score'] = this.score;
    data['percentScore'] = this.percentScore;
    data['averageScoreOfClass'] = this.averageScoreOfClass;
    data['completeAttempts'] = this.completeAttempts;
    data['timeSpent'] = this.timeSpent;
    data['subjectId'] = this.subjectId;
    data['beginDate'] = this.beginDate;
    data['endDate'] = this.endDate;
    data['title'] = this.title;
    data['sessionId'] = this.sessionId;
    data['sessionName'] = this.sessionName;
    data['sessionGroupId'] = this.sessionGroupId;
    data['sessionGroupName'] = this.sessionGroupName;
    data['questionCount'] = this.questionCount;
    data['showSubTitle'] = this.showSubTitle;
    data['isOptionRandom'] = this.isOptionRandom;
    data['duration'] = this.duration;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['deletedBy'] = this.deletedBy;
    data['deletedOn'] = this.deletedOn;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}
