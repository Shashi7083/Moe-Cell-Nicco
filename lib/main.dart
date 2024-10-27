import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[800]!, // Dark blue at the top
              Colors.blue[800]!, // Keep dark blue for the transition
              Colors.pink, // Pink for the left side of the middle
              Colors.yellow, // Yellow for the right side of the middle
              Colors.blueAccent!, // Dark blue at the bottom
            ],
            stops: [
              0.0, // Start of the top color
              0.2, // Transition to the pink and yellow colors
              0.4, // Midway where pink starts
              0.5, // Midway where yellow starts
              1.0, // End with the bottom dark blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Stack(
            children: [
              // Pentagon Background
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomPaint(
                  painter: PentagonPainter(),
                  child: Container(
                    height: MediaQuery.of(context).size.height, // Adjust height as needed
                  ),
                ),
              ),
              // Content on top of the pentagon
              Positioned(
                top: 10, // Adjust to position content within the pentagon
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    // Top Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
                          CircleAvatar(
                            backgroundColor: Colors.black26,
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                          // Title
                          Text(
                            'MoeCellNicco',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // Share and Settings Icons
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black26,
                                child: Icon(Icons.share, color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              CircleAvatar(
                                backgroundColor: Colors.black26,
                                child: Icon(Icons.settings, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Image or Main Content in the Middle
                    Center(
                      child: Image.asset(
                        'assets/images/img1.png', // Local asset image
                        height: 200,
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ausgang',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '----   ----',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),// Space between text and lines
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 140,
                          height: 60,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.power_settings_new, color: Colors.white),
                        ),
                        Container(
                          width: 140,
                          height: 60,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.timer, color: Colors.white),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),

                    // Consumption Text
                    Text(
                      'Consumption',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '0',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Energy Icon and Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Energy',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            '2024-10-27',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40), // Space for the new images

                    // Outer Image Container
                    Center(
                      child: Container(
                        width: 120, // Width of the outer image
                        height: 120, // Height of the outer image
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/img2.png'), // Path to outer image
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/img3.png', // Path to inner image
                            height: 120, // Height of the inner image
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PentagonPainter to draw the pentagon at the top
class PentagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.5); // Greyish color with transparency

    Path path = Path();
    double radius = 30.0; // Radius for rounding the bottom point

    // Move to the bottom vertex (point)
    path.moveTo(size.width / 2, size.height * 0.78);

    // Bottom right vertex with curve
    path.lineTo(size.width, size.height * 0.60);
    path.quadraticBezierTo(
        size.width + radius, size.height * 0.88, // Control point
        size.width, size.height * 0.60 // End point
    );

    // Top right corner
    path.lineTo(size.width, 0);
    // Top left corner
    path.lineTo(0, 0);

    // Bottom left vertex with curve
    path.lineTo(0, size.height * 0.60);
    path.quadraticBezierTo(
        -radius, size.height * 0.88, // Control point
        0, size.height * 0.60// End point
    );

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
