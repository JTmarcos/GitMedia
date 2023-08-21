import 'package:flutter/material.dart';
import 'package:gitmedia/data/models/arguments.dart';
import 'package:gitmedia/data/models/git_repositorys_model.dart';
import 'package:gitmedia/data/models/git_user_model.dart';
import 'package:gitmedia/data/repository/user_repository.dart';
import 'package:gitmedia/routes/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class CustoTextFormField extends StatefulWidget {
  final TextEditingController _controller;
  const CustoTextFormField(
      {super.key, required TextEditingController controller})
      : _controller = controller;

  @override
  State<CustoTextFormField> createState() => _CustoTextFormFieldState();
}

class _CustoTextFormFieldState extends State<CustoTextFormField> {
  final GitUserRepository client = GitUserRepository();
  late List<GitRepository> repoList;
  GitUser? user;

  Future<void> apiUserButton(String value) async {
    Future.delayed(const Duration(seconds: 2));
    try {
      final response = await client.callApi(value);
      user = response;
    } catch (e) {
      user = null;
    }
  }

  Future<void> apiRepoButton(String value) async {
    Future.delayed(const Duration(seconds: 2));
    try {
      final repoResponse = await client.callRepoList(value);
      repoList = repoResponse;
    } catch (e) {
      repoList = [];
    }
  }

  valueValidator(String? value) {
    if ((value != null && value.isEmpty) || value?.trim() == '') {
      return true;
    } else {
      return false;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: widget._controller,
          validator: (String? value) {
            if (valueValidator(value)) {
              return "Insira um usúario";
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            hintText: "Nome de usuário",
            suffixIcon: IconButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await apiUserButton(widget._controller.text);
                  await apiRepoButton(widget._controller.text);
                  
                  if (user != null) {
                    final Arguments arguments =
                      Arguments(list: repoList, user: user);
                    navigatorKey.currentState!.pushReplacementNamed(
                      Routes.searchpage,
                      arguments: arguments,
                    );
                  } else {
                    navigatorKey.currentState!
                        .pushReplacementNamed(Routes.unfindedpage);
                  }
                }
              },
              icon: const Icon(Icons.search),
              splashRadius: 20,
            ),
          ),
        ),
      ),
    );
  }
}
