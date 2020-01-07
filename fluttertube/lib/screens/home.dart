import 'package:flutter/material.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/blocs/videos_bloc.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/widgets/video_tile.dart';

import '../models/video.dart';
import 'favorites.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<VideosBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Map<String, Video>>(
                initialData: {},
                stream: BlocProvider
                    .getBloc<FavoriteBloc>()
                    .outFav,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("${snapshot.data.length}");
                  } else {
                    return Container();
                  }
                }),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Favorites()));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
              await showSearch(context: context, delegate: DataSearch());
              if (result != null) {
                final bloc = BlocProvider.getBloc<VideosBloc>();
                bloc.inSearch.add(result);
              }
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder(
          stream: bloc.outVideos,
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < snapshot.data.length) {
                      return VideoTile(snapshot.data[index]);
                    } else if (index > 1) {
                      bloc.inSearch.add(null);
                      return Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.red)),
                      );
                    }
                    return Container();
                  },
                  itemCount: snapshot.data.length + 1);
            } else {
              return Container();
            }
          }),
    );
  }
}
