import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/widgets/loading_widget.dart';
import 'package:organico/provider/remote/stream/home_provider.dart';
import 'package:organico/view/pages/category_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    String location = 'Uz,Tashkent';
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  const Center(
                    child: Text("Your Location"),
                  ),
                  Center(
                      child: DropdownButton(
                          value: location,
                          items: const [
                            DropdownMenuItem(
                                value: 'US,Washington',
                                child: Text("USA,Washington")),
                            DropdownMenuItem(
                                value: 'France,Paris',
                                child: Text("France,Paris")),
                            DropdownMenuItem(
                                value: 'UK,London', child: Text("UK,London")),
                            DropdownMenuItem(
                                value: 'Uz,Tashkent',
                                child: Text("Uzbekistan,Tashkent"))
                          ],
                          onChanged: (v) {})),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        fillColor: const Color(0xffF1F1F5),
                        filled: true,
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search anything here",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffEAEAEA), width: 2),
                            borderRadius: BorderRadius.circular(100)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffEAEAEA), width: 2),
                            borderRadius: BorderRadius.circular(100))),
                  ),
                  ListTile(
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
                    title: StreamBuilder(
                      stream: homeProvider.coupons,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: LoadingWidget(),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text("Server error"),
                          );
                        } else {
                          List<Map<String, dynamic>> data = [];
                          snapshot.data!.docs.map((docment) {
                            data.add(docment.data() as Map<String, dynamic>);
                          }).toList();
                          if (data.isEmpty) {
                            return const Text("No coupons yet");
                          } else {
                            return Text("You have ${data.length} coupon");
                          }
                        }
                      },
                    ),
                    subtitle: const Text("Let's use this coupon"),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  ListTile(
                    title: const Text(
                      "Choose Category",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: InkWell(
                        onTap: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(color: Color(0xff696974)),
                        )),
                  ),
                  SizedBox(
                      height: size.height * 0.18,
                      width: double.infinity,
                      child: StreamBuilder(
                        stream: homeProvider.products,
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Server Error"),
                            );
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: LoadingWidget(),
                            );
                          } else {
                            List<Map<String, dynamic>> data = [];
                            snapshot.data!.docs.map((docment) {
                              data.add(docment.data() as Map<String, dynamic>);
                            }).toList();
                            if (data.isEmpty) {
                              return const Center(
                                child: Text("No products yet"),
                              );
                            } else {
                              return ListView.separated(
                                  padding: const EdgeInsets.all(8),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: Container(
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFE706E),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                                width: 84,
                                                height: 60,
                                                child: Image.network(
                                                    data[index]['img'])),
                                            Text(
                                                data[index]['name'].toString()),
                                          ],
                                        ),
                                      ),
                                      onTap: () async {
                                        Stream<QuerySnapshot> category =
                                            FirebaseFirestore.instance
                                                .collection(
                                                    'products/${data[index]['name'].toString()}/${data[index]['name'].toString()}')
                                                .orderBy('created_at')
                                                .snapshots();

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CategoryPage(
                                                streamData: category,
                                                categoryName: data[index]
                                                        ['name']
                                                    .toString(),
                                              ),
                                            ));
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 10,
                                    );
                                  },
                                  itemCount: data.length);
                            }
                          }
                        },
                      )),
                  ListTile(
                    title: const Text(
                      "Best Selling",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: InkWell(
                        onTap: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(color: Color(0xff696974)),
                        )),
                  ),
                  SizedBox(
                      height: size.height * 0.27,
                      width: double.infinity,
                      child: StreamBuilder(
                        stream: homeProvider.bestSellingProducts,
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: Text(""),
                            );
                          } else {
                            List<Map<String, dynamic>> data = [];
                            snapshot.data!.docs.map((docment) {
                              data.add(docment.data() as Map<String, dynamic>);
                            }).toList();
                            return ListView.separated(
                                padding: const EdgeInsets.all(8),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 196,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 247, 145, 145),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                            width: 90,
                                            height: 90,
                                            child: Image.network(
                                                data[index]['img'])),
                                        Text(data[index]['name'].toString()),
                                        Text(data[index]['created_at'])
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 10,
                                  );
                                },
                                itemCount: data.length);
                          }
                        },
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
