import 'package:flutter/material.dart';
import 'package:movie/widgets/trending.dart';
import '../utils/text.dart';
class RecentList extends StatelessWidget {
  const RecentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Recently Viewed Movies',
            size: 20, color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recent.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        recent[index]['poster_path']),
                              ),
                            ),
                            height: 200,
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: modified_text(
                                size: 15,
                                text: recent[index]['title'] != null
                                    ? recent[index]['title']
                                    : 'Loading',color: Colors.white),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
