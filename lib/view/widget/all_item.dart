import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon_exam/models/image_model.dart';
import 'package:imtihon_exam/models/cards_model.dart';

Widget AllItem(
    BuildContext context,
    CardsModel card,
{required void Function() delete}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/card1.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 15,
              child: Text(card.number.substring(0,4) == '8600' ? 'UzCard' : 'HUMO', style: TextStyle(color: Colors.white),),
            ),
            Positioned(
              top: 50,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(card.name, style: TextStyle(color: Colors.white, fontSize: 20),),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text('9 697.25 ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('сум', style: TextStyle(color: Colors.white, fontSize: 15),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text(card.name, style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Row(
                children: [
                  Text('${card.number}',style: TextStyle(color: Colors.white,fontSize: 20)),
                  SizedBox(width: 10,),
                  Text('${card.date}',style: TextStyle(color: Colors.white,fontSize: 17)),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(onPressed: delete, icon: Icon(Icons.delete,color: Colors.white,)),
            ),

          ]
      ),
    ),
  );
}