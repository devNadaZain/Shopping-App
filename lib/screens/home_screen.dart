import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final products = List.generate(
      4,
      (i) => {
        'title': 'Product  ${i + 1}',
        'image': 'https://picsum.photos/200?random=${i + 1}',
      },
    );
    final offers = List.generate(
      5,
      (i) => {
        'desc': '${l.hotOffers} ${i + 1}',
        'image': 'https://picsum.photos/100?random=${i + 10}',
      },
    );
    return Scaffold(
      appBar: AppBar(title: Text(l.ourProducts)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: PageView.builder(
                  itemCount: products.length,
                  controller: PageController(viewportFraction: 0.8),
                  itemBuilder: (context, i) => Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.network(
                      products[i]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, i) => Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        products[i]['image']!,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        products[i]['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(l.itemAdded)));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                l.hotOffers,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: offers.length,
                itemBuilder: (context, i) => Card(
                  child: Row(
                    children: [
                      Image.network(
                        offers[i]['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(offers[i]['desc']!)),
                    ],
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
