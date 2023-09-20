import 'package:flutter/material.dart';
import 'package:greenmindsfyp/ui/venuescreen.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  // Declare and Initialize the PageController
  final PageController _pageController =
  PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [PageOne(), PageTwo(), PageThree(), PageFour()],
      ),
    );
  }

  // Dispose the PageController
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// Page One
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/w1bg.png"),
    fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.end,
        children: [

        Text('Choose',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
        Text('Choose your venue',style: TextStyle(fontSize: 18,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 65),
            child: SizedBox(
                width: 150, // <-- Your width
                height: 50, // <-- Your height
                ),
          )

        ],
      ),
    );
  }
}

// Page Two
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/w2bg.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.end,
        children: [

          Text('Select',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
          Text('Select objects to place',style: TextStyle(fontSize: 18,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 65),
            child: SizedBox(
                width: 150, // <-- Your width
                height: 50, // <-- Your height
                ),
          )

        ],
      ),
    );
  }
}

// Page Three
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/w3bg.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.end,
        children: [

          Text('Scan',style: TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Colors.white),),
          Text('Scan your space in real-time',style: TextStyle(fontSize: 17,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 65),
            child: SizedBox(
                width: 150, // <-- Your width
                height: 50, // <-- Your height
                ),
          )

        ],
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/w4bg.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.end,
        children: [

          Text('View',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
          Text('Enjoy the look',style: TextStyle(fontSize: 18,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 65),
            child: SizedBox(
                width: 150, // <-- Your width
                height: 50, // <-- Your height
                child: ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade800,
                ),onPressed: (){Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => VenueScreen())
                );}, child: Text('Next',style: TextStyle(fontSize: 20),))),
          )

        ],
      ),
    );
  }
}