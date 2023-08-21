import 'package:flutter/material.dart';
import 'package:gitmedia/data/components/bios_row.dart';
import 'package:gitmedia/data/components/custom_row.dart';
import 'package:gitmedia/data/components/custom_text_form.dart';
import 'package:gitmedia/data/components/list_view.dart';
import 'package:gitmedia/data/models/arguments.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Arguments gitUser = ModalRoute.of(context)?.settings.arguments as Arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: CustoTextFormField(
            controller: _controller,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              gitUser.user!.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CustomRow(
                account: gitUser.user!.login,
                followerUrl: gitUser.user!.followersUrl,
                image: gitUser.user!.avatarUrl,
                qntRepos: gitUser.user!.publicRepos,
                followers: gitUser.user!.followers,
                following: gitUser.user!.following),
            BiosRow(
              location: gitUser.user!.location,
              login: gitUser.user!.login,
              bios: gitUser.user!.bio,
            ),
            if (gitUser.list.isNotEmpty)
              const Divider(
                color: Colors.white,
              ),
            SizedBox(child: ListBuilder(list: gitUser.list)),
            if (gitUser.list.isNotEmpty)
              const Divider(
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}
