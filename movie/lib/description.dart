import 'package:flutter/material.dart';
import 'package:movie/utils/text.dart';
import 'booking_screen.dart';
//import 'package:movie_api/widgets/Toprated.dart';
class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
        required this.name,
        required this.description,
        required this.bannerurl,
        required this.posterurl,
        required this.vote,
        required this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: modified_text(text: '⭐ Average Rating - ' + vote,size: 14,color: Colors.white,)),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded', size: 24, color: Colors.white,)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
              modified_text(text: 'Releasing On - ' + launch_on, size: 14,color: Colors.white,)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, size: 18, color: Colors.white,)),

              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC62828),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingScreen(movieName: name)));
              },

              child: Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
