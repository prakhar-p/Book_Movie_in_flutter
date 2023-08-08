
import 'package:flutter/material.dart';
import 'package:movie/widgets/RecentList.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movie/widgets/Toprated.dart';
import 'package:movie/widgets/trending.dart';
import 'package:movie/widgets/tv.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '40ec72ec892fa9f72c2df7dfe11183fe';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MGVjNzJlYzg5MmZhOWY3MmMyZGY3ZGZlMTExODNmZSIsInN1YiI6IjY0YzNkNmM0YzkwNDRjMDBjNzZjMmJjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RJi9RDdvr9onwAdclsy4ic7-j8L2RaV1zI5h-7u6xyA';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    //print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }
  List filter=[];
  void updateList(String value){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        /*appBar: AppBar(
          title: modified_text(text: 'Flutter Movie App ❤️', color: Colors.white,size: 15,),
          backgroundColor: Colors.transparent,
        ),*/
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: [
                Container(
                  width: 270,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.black,),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            /* Clear the search field */
                          },
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
                //SizedBox(width: 8,),


              ],
            )),

        body: ListView(
          children: [
            TV(tv: tv),
            TrendingMovies(
              trending: trendingmovies,
            ),
            TopRatedMovies(
              toprated: topratedmovies,
            ),
            RecentList()
          ],
        ));
  }
}
