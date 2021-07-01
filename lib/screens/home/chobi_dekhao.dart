import 'package:ami_coding_pari_na/models/chobi_response.dart';
import 'package:ami_coding_pari_na/repositories/http_service.dart';
import 'package:flutter/material.dart';

class ChobiDekhao extends StatefulWidget {
  const ChobiDekhao({Key key}) : super(key: key);

  @override
  _ChobiDekhaoState createState() => _ChobiDekhaoState();
}

class _ChobiDekhaoState extends State<ChobiDekhao> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chobi Dekhao',
            textScaleFactor: 1, style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder(
        future: httpService.getChobi(),
        builder: (BuildContext context, AsyncSnapshot<List<Chobi>> snapshot) {
          if (snapshot.hasData) {
            List<Chobi> chobi = snapshot.data;
            return ListView(
              children: chobi
                  .map((Chobi chobi) => Column(children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                chobi.thumbnailUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              "Title: ${chobi.title}",
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                                "Id: ${chobi.id.toString()}  AlbumId: ${chobi.albumId.toString()}"),
                          ),
                        ),
                      ]))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
