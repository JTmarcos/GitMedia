import 'package:gitmedia/data/models/follower_model.dart';
import 'package:gitmedia/data/models/git_repositorys_model.dart';
import 'package:gitmedia/data/models/git_user_model.dart';

abstract class HttpRepository {
  Future<GitUser> callApi(String account);
  Future<List<GitRepository>> callRepoList(String account);
  Future<List<Follower>> callFollowList(String followUrl);
  Future<GitUser> getFollower(String value);
  Future<List<GitRepository>> getRepoFollower(String value);
}
