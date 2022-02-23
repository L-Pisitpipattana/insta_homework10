import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'insta.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Insta> InstaList = [
    Insta(imguser: 'assets/images/exo.jpg', img: 'assets/images/suho.jpg',
        userpost: 'weareoneEXO', comments: [Comments(user: 'Katrina', comment: "GLOBAL FANS?! finally another live stream cause i missed today's live 😭"),Comments(user: 'Ranzie', comment: 'welcome back leadernim!!❤')],
        caption: "SUHO's Youtube live 'SUHO's resume for EXO-L Inc.' to be aired on 2/19 at 9PM KST! \nOnline greeting with global fans! "),
    Insta(imguser: 'assets/images/nct.jpg', img: 'assets/images/jay.jpg',
        userpost: 'NCTsmtown',comments: [Comments(user: 'Lych', comment: 'Happy birthday our valentine boy ❤'),Comments(user: 'Daisy', comment: '💚💚💚')],
  caption: '🎂HAPPY BIRTHDAY TO JAEHYUN \nWE💚YOU \n#HAPPYJAEHYUNDAY \n#재현 #NCT #NCT127'),
    Insta(imguser: 'assets/images/taeyeon.jpg', img: 'assets/images/invu.jpg',
        userpost: 'GirlsGeneration',comments: [Comments(user: 'Gabriel', comment: 'LOVE YOU TAEYEON 💙 I LOVE THIS SONG SO MUCH 🔥🔥🔥'),Comments(user: 'Yumi', comment: 'Absolutely gorgeous!!!')],
  caption: '태연 TAEYEON The 3rd Album [INVU] \n🎧 Listen now on your favorite platform'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(title: Text('InstaSMTown',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(insta: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Insta insta;

  const MyCard({
    Key? key,
    required this.insta,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.insta.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.insta.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.insta.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.insta.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.insta.comments.length;i++)
                Row(
                  children: [
                    SizedBox(height: 23.0,),
                    Text(
                        '${widget.insta.comments[i].user}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                        color: Colors.pink,
                          fontSize: 15.0,
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    Text(
                      '${widget.insta.comments[i].comment}',
                      style: TextStyle(

                      ),
                    )
                  ],
                ),
              ],
            ),
          ),


                Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        like = !like;
                      });
                    }, icon: like? Icon(Icons.favorite,color: Colors.pink,): Icon(Icons.favorite_border),),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value){

                          setState(() {
                            widget.insta.comments.add(Comments(user: 'Flutter', comment: value));
                            controller.clear();

                          });
                        },
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Add a comment',
                        ),
                      ),
                    ),
                  ],
                )


        ],
      ),
    );
  }
}
