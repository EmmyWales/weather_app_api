import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0XFF5936B4), borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "19°",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "H: 24°",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "L: 18°",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Montreal, Canada",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BKDRTVTV",
                  style: TextStyle(
                      color: Color.fromARGB(255, 149, 144, 144),
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Mid Rain",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
