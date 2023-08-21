import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gitmedia/data/models/git_repositorys_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryCard extends StatelessWidget {
  final GitRepository repository;
  const RepositoryCard({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  final web = Uri.parse(repository.htmlUrl);
                  launchUrl(web, mode: LaunchMode.externalApplication);
                },
                child: SizedBox( width:MediaQuery.of(context).size.width * 0.60 ,child: AutoSizeText(repository.name)),
              ),
              
                
              
              if (repository.language != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8 ,24, 8),
                  child: Text( repository.language!),
                ),
            ],
            
          ),
          Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ), child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(repository.visibility, style: const TextStyle(color: Color.fromRGBO(115,122,123,1)),),
                  )),
                ) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (repository.description != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        repository.description!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      )),
                ),


            ],
          )
        ],
      ),
    );
  }
}
