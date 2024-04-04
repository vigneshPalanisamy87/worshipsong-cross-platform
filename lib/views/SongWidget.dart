import 'package:flutter/material.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:worshipsong_cross_platform/parser/SongParser.dart';

import '../domain/Song.dart';

class SongWidget extends StatelessWidget {
  SongWidget(this.song);
  final Song song;
  @override
  Widget build(BuildContext context) {
    List<String> verses = SongParser().parseSong(song);
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: SingleChildScrollView(
        child: CardList(listData: verses),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<String> listData;

  CardList({required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListView.builder(
            itemCount: listData.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: StyledText(
                  text: listData[index],
                  tags: {
                    'tamil': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  },
                ) ,
              );
            },
          ),
        ],
      ),
    );
  }
}