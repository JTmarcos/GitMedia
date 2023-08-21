import 'package:gitmedia/data/models/follower_model.dart';
import 'package:gitmedia/data/models/git_repositorys_model.dart';
import 'package:gitmedia/data/models/git_user_model.dart';

class Arguments {
  final List<GitRepository> list;
  final GitUser? user;

  Arguments({required this.list, required this.user});
}

class FollowerPageArguments {
  final String name;
  final List<Follower>? followers;

  FollowerPageArguments({required this.name, required this.followers});
}
