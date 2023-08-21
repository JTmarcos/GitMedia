import 'dart:convert';

import 'package:gitmedia/data/models/follower_model.dart';
import 'package:gitmedia/data/models/git_user_model.dart';
import 'package:gitmedia/data/repository/http_repository.dart';
import 'package:gitmedia/data/models/git_repositorys_model.dart';

import 'package:http/http.dart' as http;

class GitUserRepository implements HttpRepository {
  @override
  Future<GitUser> callApi(String account) async {
    var client = http.Client();

    try {
      final url = Uri.parse("https://api.github.com/users/$account");
      final response = await client.get(url);
      return GitUser.fromJson(response.body);
    } catch (e) {
      throw Exception("Error").toString();
    }
  }

  @override
  Future<List<GitRepository>> callRepoList(String account) async {
    var client = http.Client();
    try {
      final url = Uri.parse("https://api.github.com/users/$account/repos");
      final responseRepo = await client.get(url);
      final List<dynamic> repoJsonList = json.decode(responseRepo.body);
      final List<GitRepository> repos =
          (repoJsonList).map((e) => GitRepository.fromMap(e)).toList();

      return repos;
    } catch (e) {
      throw Exception("Error").toString();
    }
  }

  @override
  Future<List<Follower>> callFollowList(followUrl) async {
    var client = http.Client();
    try {
      Future.delayed(const Duration(seconds: 2));
      final url = Uri.parse(followUrl);
      final responseFollow = await client.get(url);
      final List<dynamic> followJsonList = json.decode(responseFollow.body);
      final List<Follower> respo =
          (followJsonList).map((e) => Follower.fromMap(e)).toList();
      return respo;
    } catch (e) {
      throw Exception("Error").toString();
    }
  }

  @override
  Future<GitUser> getFollower(String value) async {
    var client = http.Client();
    try {
      final url = Uri.parse(value);
      final response = await client.get(url);
      return GitUser.fromJson(response.body);
    } catch (e) {
      throw Exception("Error").toString();
    }
  }

  @override
  Future<List<GitRepository>> getRepoFollower(String value) async {
    var client = http.Client();
    try {
      final url = Uri.parse(value);
      final response = await client.get(url);
      final List<dynamic> responseJsonList = jsonDecode(response.body);
      final List<GitRepository> respo =
          (responseJsonList).map((e) => GitRepository.fromMap(e)).toList();
      return respo;
    } catch (e) {
      throw Exception("Error").toString();
    }
  }
}
