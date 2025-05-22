import 'package:riverpod/riverpod.dart';
import 'package:seacre_t/models/user_model.dart';

final userProvider = StateProvider<User>(
  (ref) => User(
    id: null,
    username: null,
    displayName: null,
    profilePic: null,
    joinedDate: null,
    joinedRooms: [],
    invites: [],
  ),
);
