import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sm_with_rest_api/models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Obx(
                    () => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: product.isFavorite.value
                            ? Icon(Icons.favorite_rounded)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          product.isFavorite.toggle();
                        },

                        // Icon(Icons.favorite_rounded)
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                child: Row(
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            SizedBox(
              height: 8,
            ),
            Text(
              '\$${product.name}',
              style: TextStyle(fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
