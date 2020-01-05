import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/api.dart';
import 'package:fluttertube/models/video.dart';
import 'dart:async';

class VideosBloc extends BlocBase {

  Api api;
  List<Video> videos;

  final StreamController<List<Video>> _vidoesController = StreamController<List<Video>>();
  Stream get outVideos => _vidoesController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;


  VideosBloc(){
    api = Api();

    _searchController.stream.listen(_search);
  }


  void _search(String search) async{
    videos = await api.search(search);
    _vidoesController.sink.add(videos);
  }

  @override
  void dispose() {
    _vidoesController.close();
    _searchController.close();
    super.dispose();
  }

}