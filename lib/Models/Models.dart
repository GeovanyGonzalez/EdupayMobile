// ignore_for_file: unnecessary_cast, constant_identifier_names


class User {
  final int id;
  final String name;
  final String email;
  final String password; // This should never be stored in plain text
  final String? profilePhoto;
  final int? groupId;
  final RolEnum role;
  final String? occupation;
  final String? address;
  final int? tutorId;
  final String? phone;
  final String lastName;
  final String? customerId;
  final List<UserNotifications>? notification;

  // Relational fields (assuming corresponding models exist)
  final Group? grupo;
  final User? tutor;
  final List<User>? tutorados;
  final List<UserActivity>? actividades;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password, // Remember to handle securely, not shown here
    this.profilePhoto,
    this.groupId,
    required this.role,
    this.occupation,
    this.address,
    this.tutorId,
    this.phone,
    required this.lastName,
    this.customerId,
    this.notification,
    this.grupo,
    this.tutor,
    this.tutorados,
    this.actividades,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String, // Handle securely, not shown here
        profilePhoto: json['profilePhoto'] as String?,
        groupId: json['groupId'] as int?,
        role: RolEnum.values[json['role'] as int], // Assuming RolEnum is defined elsewhere
        occupation: json['occupation'] as String?,
        address: json['address'] as String?,
        tutorId: json['tutorId'] as int?,
        phone: json['phone'] as String?,
        lastName: json['lastName'] as String,
        customerId: json['CustomerId'] as String?,
        notification: json['notification'] != null
            ? (json['notification'] as List).map((e) => UserNotifications.fromJson(e as Map<String, dynamic>)).toList()
            : null,
        grupo: json['grupo'] != null ? Group.fromJson(json['grupo'] as Map<String, dynamic>) : null,
        tutor: json['tutor'] != null ? User.fromJson(json['tutor'] as Map<String, dynamic> ) : null,        
          tutorados: json['tutorados'] != null
          ? (json['tutorados'] as List)
              .map((e) => e is Map<String, dynamic> ? User.fromJson(e) : null)
              .where((e) => e != null)
              .cast<User>()
              .toList()
          : [],
      );

  // Add other methods as needed (e.g., toJson, copyWith)
}

class UserActivity {
  final int userId;
  final int activityId;

  // Relational fields (assuming corresponding models exist)
  final User? user;
  final ExtracurricularActivity? activity;

  UserActivity({
    required this.userId,
    required this.activityId,
    this.user,
    this.activity,
  });

  factory UserActivity.fromJson(Map<String, dynamic> json) => UserActivity(
        userId: json['userId'] as int,
        activityId: json['activityId'] as int,
        user: json['user'] != null ? User.fromJson(json['user'] as Map<String, dynamic>) : null,
        activity: json['activity'] != null
            ? ExtracurricularActivity.fromJson(json['activity'] as Map<String, dynamic>)
            : null,
      );

  // Add other methods as needed (e.g., toJson, copyWith)
}

class Notification {
  final int id;
  final String title;
  final String description;
  final List<UserNotifications>? userNotifications;

  Notification({
    required this.id,
    required this.title,
    required this.description,
    this.userNotifications,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        userNotifications: json['userNotifications'] != null
            ? (json['userNotifications'] as List)
                .map((e) => UserNotifications.fromJson(e as Map<String, dynamic>))
                .toList()
            : null,
      );

  // Add other methods as needed (e.g., toJson, copyWith)
}

class UserNotifications {
  final int userId;
  final int notificationId;

  // Relational fields (assuming corresponding models exist)
  final User? user;
  final Notification? notification;

  UserNotifications({
    required this.userId,
    required this.notificationId,
    this.user,
    this.notification,
  });

  factory UserNotifications.fromJson(Map<String, dynamic> json) =>
      UserNotifications(
        userId: json['userId'] as int,
        notificationId: json['notificationId'] as int,
        user: json['user'] != null ? User.fromJson(json['user'] as Map<String, dynamic>) : null,
        notification: json['notification'] != null ? Notification.fromJson(json['notification'] as Map<String, dynamic>) : null
      );

  // Add other methods as needed (e.g., toJson, copyWith)
}

class Period {
  final int id;
  final String? name;
  final double? price;
  final DateTime startDate;
  final DateTime endDate;
  final String stripeProductId;
  final String? stripeSubscriptionId;
  final String? planId;
  final bool cancelAtEnd;

  // Relational fields (assuming corresponding models exist)
  final List<Grade>? grades;

  Period({
    required this.id,
    this.name,
    this.price,
    required this.startDate,
    required this.endDate,
    required this.stripeProductId,
    this.stripeSubscriptionId,
    this.planId,
    required this.cancelAtEnd,
    this.grades,
  });

  factory Period.fromJson(Map<String, dynamic> json) => Period(
        id: json['id'] as int,
        name: json['name'] as String?,
        price: json['price'] != null ? double.parse(json['price'] as String) : null,
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        stripeProductId: json['stripeProductId'] as String,
        stripeSubscriptionId: json['stripeSubscriptionId'] as String?,
        planId: json['planId'] as String?,
        cancelAtEnd: json['cancelAtEnd'] as bool,
        grades: json['grades'] != null
            ? (json['grades'] as List).map((e) => Grade.fromJson(e as Map<String, dynamic>)).toList()
            : null,
      );

  // Add other methods as needed (e.g., toJson, copyWith)
}

class Grade {
  final int id;
  final String? name;
  final int periodId;

  // Relational fields (assuming corresponding models exist)
  final Period? period;
  final List<Group>? groups;

  Grade({
    required this.id,
    this.name,
    required this.periodId,
    this.period,
    this.groups,
  });

  factory Grade.fromJson(Map<String, dynamic> json) => Grade(
        id: json['id'] as int,
        name: json['name'] as String?,
        periodId: json['periodId'] as int,
        period: json['period'] != null ? Period.fromJson(json['period'] as Map<String, dynamic>) : null,
        groups: json['groups'] != null
            ? (json['groups'] as List).map((e) => Group.fromJson(e as Map<String, dynamic>)).toList()
            : null,
      );

  // Add other methods as needed (e.g., toJson, copyWith)
}

class Group {
  final int id;
  final String? name;
  final int? capacity;
  final int gradeId;

  // Relational fields (assuming corresponding models exist)
  final Grade? grade;
  final List<User>? users;

  Group({
    required this.id,
    this.name,
    this.capacity,
    required this.gradeId,
    this.grade,
    this.users,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json['id'] as int,
        name: json['name'] as String?,
        capacity: json['capacity'] as int?,
        gradeId: json['gradeId'] as int,
        grade: json['grade'] != null ? Grade.fromJson(json['grade'] as Map<String, dynamic>) : null,
        users: json['users'] != null
    ? (json['users'] as List).map((e) => User.fromJson(e as Map<String, dynamic>)).toList()
    : null,
      );

  // Add other methods as needed (e.g., toJson, copyWith)
}

enum RolEnum {
  ADMIN,
  FATHER,
  STUDENT,
  // Add more roles here as needed
}

class ExtracurricularActivity {
  final int id;
  final String? name;
  final String? description;
  final double? price;
  final String? image;
  final DateTime startDate;
  final DateTime endDate;

  // Relational fields (assuming corresponding models exist)
  final List<UserActivity>? users;

  ExtracurricularActivity({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    required this.startDate,
    required this.endDate,
    this.users,
  });

  factory ExtracurricularActivity.fromJson(Map<String, dynamic> json) =>
      ExtracurricularActivity(
        id: json['id'] as int,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] != null ? double.parse(json['price'] as String) : null,
        image: json['image'] as String?,
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        users: json['users'] != null
    ? (json['users'] as List<Map<String, dynamic>>).map((e) => UserActivity.fromJson(e)).toList()
    : null,
      );

  // Add other methods as needed (e.g., toJson, copyWith)
}