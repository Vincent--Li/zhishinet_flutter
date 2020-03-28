class UserInfoModel {
  int userId;
  int ubuserId;
  String username;
  String givename;
  int gender;
  String email;
  String cellNumber;
  String avatar;
  int themeId;
  bool changePasswordOnLogon;
  int provinceId;
  String provinceName;
  int cityId;
  String cityName;
  int districtId;
  String districtName;
  int schoolId;
  String schoolName;
  int tenantId;
  String userPassword;
  String secretQuestion;
  String firstName;
  String middleName;
  String lastName;
  String phoneNumber;
  String userAddress;
  String city;
  String profileImagePath;
  int userThemeId;
  int dateLastLogOn;
  int dateLastPasswordChange;
  int userStatus;
  int activeRoleId;
  String jobTitle;
  String fullName;
  int indexFailOver;
  String companyName;
  String companyWebsite;
  String userRoleTitles;
  String userType;
  int vipEndDate;
  String classType;
  bool isVip;
  String userNameType;
  bool eduyunVerified;
  List<String> roles;
  List<Details> details;
  List<ClassList> classList;
  bool deleted;
  bool socialUser;
  bool learner;

  UserInfoModel(
      {this.userId,
        this.ubuserId,
        this.username,
        this.givename,
        this.gender,
        this.email,
        this.cellNumber,
        this.avatar,
        this.themeId,
        this.changePasswordOnLogon,
        this.provinceId,
        this.provinceName,
        this.cityId,
        this.cityName,
        this.districtId,
        this.districtName,
        this.schoolId,
        this.schoolName,
        this.tenantId,
        this.userPassword,
        this.secretQuestion,
        this.firstName,
        this.middleName,
        this.lastName,
        this.phoneNumber,
        this.userAddress,
        this.city,
        this.profileImagePath,
        this.userThemeId,
        this.dateLastLogOn,
        this.dateLastPasswordChange,
        this.userStatus,
        this.activeRoleId,
        this.jobTitle,
        this.fullName,
        this.indexFailOver,
        this.companyName,
        this.companyWebsite,
        this.userRoleTitles,
        this.userType,
        this.vipEndDate,
        this.classType,
        this.isVip,
        this.userNameType,
        this.eduyunVerified,
        this.roles,
        this.details,
        this.classList,
        this.deleted,
        this.socialUser,
        this.learner});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    ubuserId = json['ubuserId'];
    username = json['username'];
    givename = json['givename'];
    gender = json['gender'];
    email = json['email'];
    cellNumber = json['cellNumber'];
    avatar = json['avatar'];
    themeId = json['themeId'];
    changePasswordOnLogon = json['changePasswordOnLogon'];
    provinceId = json['provinceId'];
    provinceName = json['provinceName'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    districtId = json['districtId'];
    districtName = json['districtName'];
    schoolId = json['schoolId'];
    schoolName = json['schoolName'];
    tenantId = json['tenantId'];
    userPassword = json['userPassword'];
    secretQuestion = json['secretQuestion'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    userAddress = json['userAddress'];
    city = json['city'];
    profileImagePath = json['profileImagePath'];
    userThemeId = json['userThemeId'];
    dateLastLogOn = json['dateLastLogOn'];
    dateLastPasswordChange = json['dateLastPasswordChange'];
    userStatus = json['userStatus'];
    activeRoleId = json['activeRoleId'];
    jobTitle = json['jobTitle'];
    fullName = json['fullName'];
    indexFailOver = json['indexFailOver'];
    companyName = json['companyName'];
    companyWebsite = json['companyWebsite'];
    userRoleTitles = json['userRoleTitles'];
    userType = json['userType'];
    vipEndDate = json['vipEndDate'];
    classType = json['classType'];
    isVip = json['isVip'];
    userNameType = json['userNameType'];
    eduyunVerified = json['eduyunVerified'];
    roles = json['roles'].cast<String>();
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
    if (json['classList'] != null) {
      classList = new List<ClassList>();
      json['classList'].forEach((v) {
        classList.add(new ClassList.fromJson(v));
      });
    }
    deleted = json['deleted'];
    socialUser = json['socialUser'];
    learner = json['learner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['ubuserId'] = this.ubuserId;
    data['username'] = this.username;
    data['givename'] = this.givename;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['cellNumber'] = this.cellNumber;
    data['avatar'] = this.avatar;
    data['themeId'] = this.themeId;
    data['changePasswordOnLogon'] = this.changePasswordOnLogon;
    data['provinceId'] = this.provinceId;
    data['provinceName'] = this.provinceName;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['districtId'] = this.districtId;
    data['districtName'] = this.districtName;
    data['schoolId'] = this.schoolId;
    data['schoolName'] = this.schoolName;
    data['tenantId'] = this.tenantId;
    data['userPassword'] = this.userPassword;
    data['secretQuestion'] = this.secretQuestion;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['userAddress'] = this.userAddress;
    data['city'] = this.city;
    data['profileImagePath'] = this.profileImagePath;
    data['userThemeId'] = this.userThemeId;
    data['dateLastLogOn'] = this.dateLastLogOn;
    data['dateLastPasswordChange'] = this.dateLastPasswordChange;
    data['userStatus'] = this.userStatus;
    data['activeRoleId'] = this.activeRoleId;
    data['jobTitle'] = this.jobTitle;
    data['fullName'] = this.fullName;
    data['indexFailOver'] = this.indexFailOver;
    data['companyName'] = this.companyName;
    data['companyWebsite'] = this.companyWebsite;
    data['userRoleTitles'] = this.userRoleTitles;
    data['userType'] = this.userType;
    data['vipEndDate'] = this.vipEndDate;
    data['classType'] = this.classType;
    data['isVip'] = this.isVip;
    data['userNameType'] = this.userNameType;
    data['eduyunVerified'] = this.eduyunVerified;
    data['roles'] = this.roles;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    if (this.classList != null) {
      data['classList'] = this.classList.map((v) => v.toJson()).toList();
    }
    data['deleted'] = this.deleted;
    data['socialUser'] = this.socialUser;
    data['learner'] = this.learner;
    return data;
  }
}

class Details {
  int schoolId;
  String grade;
  int globalSessionId;
  String className;
  String code;
  int isAllow;
  String classType;
  int expirationReminding;
  bool organization;
  String title;
  String school;
  String displayTitle;

  Details(
      {this.schoolId,
        this.grade,
        this.globalSessionId,
        this.className,
        this.code,
        this.isAllow,
        this.classType,
        this.expirationReminding,
        this.organization,
        this.title,
        this.school,
        this.displayTitle});

  Details.fromJson(Map<String, dynamic> json) {
    schoolId = json['schoolId'];
    grade = json['grade'];
    globalSessionId = json['globalSessionId'];
    className = json['className'];
    code = json['code'];
    isAllow = json['isAllow'];
    classType = json['classType'];
    expirationReminding = json['expirationReminding'];
    organization = json['organization'];
    title = json['title'];
    school = json['school'];
    displayTitle = json['displayTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolId'] = this.schoolId;
    data['grade'] = this.grade;
    data['globalSessionId'] = this.globalSessionId;
    data['className'] = this.className;
    data['code'] = this.code;
    data['isAllow'] = this.isAllow;
    data['classType'] = this.classType;
    data['expirationReminding'] = this.expirationReminding;
    data['organization'] = this.organization;
    data['title'] = this.title;
    data['school'] = this.school;
    data['displayTitle'] = this.displayTitle;
    return data;
  }
}

class ClassList {
  int schoolId;
  String grade;
  int globalSessionId;
  String className;
  String code;
  int isAllow;
  String classType;
  int expirationReminding;
  bool organization;
  String title;
  String school;
  String displayTitle;

  ClassList(
      {this.schoolId,
        this.grade,
        this.globalSessionId,
        this.className,
        this.code,
        this.isAllow,
        this.classType,
        this.expirationReminding,
        this.organization,
        this.title,
        this.school,
        this.displayTitle});

  ClassList.fromJson(Map<String, dynamic> json) {
    schoolId = json['schoolId'];
    grade = json['grade'];
    globalSessionId = json['globalSessionId'];
    className = json['className'];
    code = json['code'];
    isAllow = json['isAllow'];
    classType = json['classType'];
    expirationReminding = json['expirationReminding'];
    organization = json['organization'];
    title = json['title'];
    school = json['school'];
    displayTitle = json['displayTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolId'] = this.schoolId;
    data['grade'] = this.grade;
    data['globalSessionId'] = this.globalSessionId;
    data['className'] = this.className;
    data['code'] = this.code;
    data['isAllow'] = this.isAllow;
    data['classType'] = this.classType;
    data['expirationReminding'] = this.expirationReminding;
    data['organization'] = this.organization;
    data['title'] = this.title;
    data['school'] = this.school;
    data['displayTitle'] = this.displayTitle;
    return data;
  }
}
