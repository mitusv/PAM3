import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/barber_controller.dart';

class BarberShopScreen extends StatelessWidget {
  BarberShopScreen({Key? key}) : super(key: key);

  final BarberController controller = Get.put(BarberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          final data = controller.barberData.value;

          if (data == null) {
            return Center(child: Text('Failed to load data'));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Oslo, Norway',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('src/profile.png'),
                      ),
                    ],
                  ),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(data.bannerImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0), // Padding added
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF363062), // Purple background
                            foregroundColor: Colors.white, // White text color
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // 10px border radius
                            ),
                          ),
                          child: Text(data.bannerButtonTitle),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Search Barbershops',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 40, // Fixed width for the square button
                        height: 40, // Fixed height for the square button
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF363062), // Purple background
                            foregroundColor: Colors.white, // White icon color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius
                            ),
                          ),
                          child:
                              Icon(Icons.filter_list, size: 24), // Icon inside
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Nearest Barbershop',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.nearestBarbershop.length,
                    itemBuilder: (context, index) {
                      final shop = data.nearestBarbershop[index];
                      return ListTile(
                        leading: Image.network(shop.image, width: 80),
                        title: Text(shop.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 14),
                                SizedBox(width: 4),
                                Text(shop.locationWithDistance),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, size: 14, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  shop.reviewRate.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  // "See All" Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF363062), // Purple background
                        foregroundColor: Colors.white, // White text color
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // 10px border radius
                        ),
                      ),
                      child: Text('See All'),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Most Recommended Barbershops',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: PageView.builder(
                      itemCount: data.mostRecommended.length,
                      itemBuilder: (context, index) {
                        final shop = data.mostRecommended[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: NetworkImage(shop.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    shop.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, size: 14),
                                      SizedBox(width: 4),
                                      Text(
                                        shop.locationWithDistance,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 14, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text(
                                        shop.reviewRate.toString(),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.list.length,
                    itemBuilder: (context, index) {
                      final shop = data.list[index];
                      return ListTile(
                        leading: Image.network(shop.image, width: 80),
                        title: Text(shop.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 14),
                                SizedBox(width: 4),
                                Text(shop.locationWithDistance),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, size: 14, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  shop.reviewRate.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
