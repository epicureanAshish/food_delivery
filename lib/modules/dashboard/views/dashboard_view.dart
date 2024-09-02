import 'package:food_delivery/constants/exports.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.pin_drop_outlined), label: "Swiggy", ),
        BottomNavigationBarItem(icon: Icon(Icons.rice_bowl_outlined), label: "Food", ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined), label: "Instamart", ),
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Dineout", ),
        BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_outlined), label: "Reorder", ),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: "Genie", ),
      ]),
    );
  }
}
