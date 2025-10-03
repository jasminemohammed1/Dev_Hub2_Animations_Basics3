import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin{
  
  //=modifyyy to add the animationobject,
  //modify to add the animation controllers
 late Animation<AlignmentGeometry>_animationyellow;//animation object
 late Animation<AlignmentGeometry>_animationgreen;
late AnimationController _controller;




  @override
  void dispose()
  {
    super.dispose();
    _controller.dispose();

  }
  @override
  void initState() {

    _controller=AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        reverseDuration: Duration(seconds: 3)
    );

    super.initState();
    _animationgreen=Tween<AlignmentGeometry>(begin: Alignment.centerLeft,end: Alignment.centerRight).animate(_controller);
    _animationyellow=Tween<AlignmentGeometry>(begin: Alignment.topCenter,end: Alignment.bottomCenter).animate(_controller);



  }
  
  @override build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Transition Foo Basics"),
      ),
      body: Center(
        child: Column(
          children: [
            _getstack(),
            _getbuttons(),

          ],
        ),
      ),

    ) ;
   
 }
  

  Widget _getstack()
  {//Modifyyy
    return Expanded(
        child: Stack(
          children: [
            AlignTransition(
                alignment:_animationgreen ,
                child:CircleAvatar(
                  backgroundColor: Colors.green,
                ),
            ),
            AlignTransition(
                alignment: _animationyellow,
                child:  CircleAvatar(
                  backgroundColor: Colors.yellow,
                ),)


          ],

        ));
  }
  Widget _getbuttons()
  {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: (){
        //logic
          _controller.forward();

        }, child: Text("Forward")),
        ElevatedButton(onPressed: (){
          //logic
          _controller.reverse();

        }, child: Text("Reverse")),
        ElevatedButton(onPressed: (){
        //logic
          _controller.stop();
        }, child: Text("Stop")),
        ElevatedButton(onPressed: (){
          _controller.reset();
        //logic

        }, child: Text("Reset")),
        ElevatedButton(onPressed: (){
        //logic
          _controller.repeat();

        }, child: Text("Repeat")),
        ElevatedButton(onPressed: (){
         //logic
          _controller.repeat(reverse: true);

        }, child: Text("Reapeat(reverse=true)")),



      ],

    );
  }
}

