import 'package:riverpod/riverpod.dart';
import 'package:seacre_t/models/user_model.dart';

final userProvider = StateProvider<User>(
  (ref) => User(
    id: '',
    username: '',
    displayName: '',
    profilePic: '',
    joinedDate: '',
    joinedRooms: [],
    invites: [],
  ),
);
