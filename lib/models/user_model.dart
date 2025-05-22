import 'package:intl/intl.dart';

class User {
  final String? id;
  final String? username;
  final String? displayName;
  final String? profilePic;
  final String? joinedDate; // it's a String in dd/MM/yyyy
  final List<String> joinedRooms;
  final List<String> invites;

  User({
    required this.id,
    required this.username,
    required this.displayName,
    required this.profilePic,
    required this.joinedDate,
    required this.joinedRooms,
    required this.invites,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      displayName: json['displayName'],
      profilePic: json['profilePic'],
      joinedDate: _formatDateToDdMmYyyy(json['joinedDate']),
      joinedRooms: List<String>.from(json['joinedRooms']),
      invites: List<String>.from(json['invites']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'displayName': displayName,
      'profilePic': profilePic,
      'joinedDate': joinedDate, // already formatted
      'joinedRooms': joinedRooms,
      'invites': invites,
    };
  }

  static String _formatDateToDdMmYyyy(String rawDate) {
    try {
      final cleaned = rawDate.split('GMT')[0].trim();
      final parsedDate = DateFormat(
        'EEE MMM dd yyyy HH:mm:ss',
        'en_US',
      ).parse(cleaned);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (_) {
      return DateFormat('dd/MM/yyyy').format(DateTime.now());
    }
  }

  // copyWith method
  User copyWith({
    String? id,
    String? username,
    String? displayName,
    String? profilePic,
    String? joinedDate,
    List<String>? joinedRooms,
    List<String>? invites,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      profilePic: profilePic ?? this.profilePic,
      joinedDate: joinedDate ?? this.joinedDate,
      joinedRooms: joinedRooms ?? List<String>.from(this.joinedRooms),
      invites: invites ?? List<String>.from(this.invites),
    );
  }
}
