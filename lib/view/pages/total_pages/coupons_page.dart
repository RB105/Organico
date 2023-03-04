import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CouponsPage extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const CouponsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your coupons'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
               elevation: 0,
               color: const Color.fromARGB(255, 192, 43, 73),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xffE9F0F7),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: SvgPicture.asset('assets/images/IcCoupon.svg'),
                    ),
                  ),
                  title: Text(data[index]['name'].toString()),
                  subtitle: Text(data[index]['remain'].toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
              );
            },
            itemCount: data.length),
      ),
    );
  }
}
