import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:produk_card/produk_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              ProdukCard(
                id: '1',
                imageUrl: 'https://altitude.ph/cdn/shop/collections/AD_Store_Revamp_DJI-28_2000x.jpg',
                productName: 'DJI Avata 2',
                categoryName: 'Mainan, Hobi, & Koleksi',
                rating: 4,
                isAvailable: true,
                price: 8699000,
                onTap: (id) {
                  developer.log(">> onTap $id");
                },
                onFavoritePressed: (id, isFav) {
                  developer.log(">> $id | $isFav");
                },
              ),
              ProdukCard(
                id: '2',
                imageUrl: 'assets/djiMavic.webp',
                productName: 'DJI 4 Mavic Pro',
                shortDescription:
                    'Discover the DJI Mavic Series drones, browse through a wide selection of accessories, and find service plans to help you fly with peace of mind.',
                categoryName: 'Mainan, Hobi, & Koleksi',
                rating: 5,
                discountPercentage: 25,
                localePrice: 'ms_MY',
                price: 8229,
                onTap: (id) {
                  developer.log(">> onTap $id");
                },
                onFavoritePressed: (id, isFav) {
                  developer.log(">> $id | $isFav");
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProdukCard(
                id: '1',
                imageUrl: 'https://altitude.ph/cdn/shop/files/AD_PH_DJI_MINI_3_DJI_RC_Standard_179409a6-7b9d-4170-8e8d-e6421cd362f5_800x.jpg',
                productName: 'DJI Neo Basic',
                categoryName: 'Mainan, Hobi, & Koleksi',
                rating: 4,
                isAvailable: true,
                discountPercentage: 15,
                price: 760,
                localePrice: 'en_US',
                onTap: (id) {
                  developer.log(">> onTap $id");
                },
                onFavoritePressed: (id, isFav) {
                  developer.log(">> $id | $isFav");
                },
              ),
              ProdukCard(
                id: '2',
                imageUrl: 'assets/djiMavic.webp',
                productName: 'DJI 4 Mavic Pro',
                shortDescription:
                    'Discover the DJI Mavic Series drones, browse through a wide selection of accessories, and find service plans to help you fly with peace of mind.',
                categoryName: 'Mainan, Hobi, & Koleksi',
                rating: 5,
                localePrice: 'hi_IN',
                priceStart: 38749,
                priceEnd: 44872,
                onTap: (id) {
                  developer.log(">> onTap $id");
                },
                onFavoritePressed: (id, isFav) {
                  developer.log(">> $id | $isFav");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
