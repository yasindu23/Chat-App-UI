// room_model.dart
import 'user_model.dart';

class Room {
  final String roomName;
  final String image;
  final String admin; // Can be a userId or username
  final String description;
  List<User> members = [];

  Room({
    required this.roomName,
    required this.image,
    required this.admin,
    required this.description,
    required this.members,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'roomName': roomName,
      'image': image,
      'admin': admin,
      'description': description,
      'members': members.map((member) => member.toJson()).toList(),
    };
  }

  // From JSON
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomName: json['roomName'],
      image: json['image'],
      admin: json['admin'],
      description: json['description'],
      members: (json['members'] as List).map((e) => User.fromJson(e)).toList(),
    );
  }
}
