import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:termproject/screens/Home_Youtube.dart';

class start_page extends StatelessWidget {
  const start_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/RIIZE1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'WELCOME',
                textAlign: TextAlign.center,
                style: GoogleFonts.sairaStencilOne(
                  color:  const Color(0xFFE5F0FF),
                  fontSize: 75.5,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen())
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color:  const Color(0xFFC8E0FF),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'START',//ปุ่มกด
                    style: GoogleFonts.sairaStencilOne(
                      color: const Color(0xF021303B),
                      fontSize: 17.5,
                      //fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}