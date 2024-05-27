import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        height: size.height / 3.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:
                ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
            image: const AssetImage('image/img.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'What would you like to find?',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 228, 228, 228),
                  contentPadding: const EdgeInsets.only(top: 5),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Color.fromARGB(255, 146, 146, 146),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 131, 131, 131),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
