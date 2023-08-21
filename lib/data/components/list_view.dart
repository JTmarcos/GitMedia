import 'package:flutter/material.dart';
import 'package:gitmedia/data/components/repo_card.dart';
import 'package:gitmedia/data/models/git_repositorys_model.dart';

class ListBuilder extends StatefulWidget {
  final List<GitRepository> list;

  const ListBuilder({super.key, required this.list});

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Center(
                child: Text(
                  "Não há nenhum repositório",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          )
        : ListView.separated(
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.white,
            ),
            shrinkWrap: true,
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              return RepositoryCard(repository: widget.list.elementAt(index));
            },
          );
  }
}
