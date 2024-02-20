import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../detail_screen.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          var item = provider.data[index];
          return GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => DetailScreen(item: item))),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), // Rounded corners
                color: Colors.grey[350],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Hero(
                        tag: item.image!,
                        child: Image.network(
                          item.image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.title!,
                    style: const TextStyle(
                        fontSize: 17, overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${item.price}',
                    style: const TextStyle(
                        fontSize: 19,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: provider.data.length,
      ),
    );
  }
}
