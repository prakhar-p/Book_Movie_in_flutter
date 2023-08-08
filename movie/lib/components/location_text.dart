import 'package:flutter/material.dart';

import 'form.dart';

class LocationText extends StatefulWidget {
  const LocationText({Key? key}) : super(key: key);

  @override
  State<LocationText> createState() => _LocationTextState();
}

class _LocationTextState extends State<LocationText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFC62828),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CardLayout()));
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
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text('see your seat in Theatre given below',style: TextStyle(color: Colors.grey),)
      ],
    );
  }
}
