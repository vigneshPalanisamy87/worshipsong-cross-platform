import 'package:flutter/material.dart';
import 'package:worshipsong_cross_platform/domain/Song.dart';

import 'SongWidget.dart';

class SongsTitleListWidget  {
  Widget defaultListView(List<Song> songs) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: index == 0 ? Text("No records available") : Text(songs[index].title),
          // subtitle: Text(prepareTamilTitle(items[index]['title'].toString(), items[index]['comments'].toString())),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ct) => SongWidget(songs[index])));
          },
        );
      },
    );
  }
}