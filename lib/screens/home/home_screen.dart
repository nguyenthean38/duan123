import 'package:flutter/material.dart';
import 'package:flutter_end/constants/app_icons.dart';
import 'package:flutter_end/data/models/destination_model.dart';
import 'package:flutter_end/data/models/firebase/Entertainment.dart';
import 'package:flutter_end/data/models/firebase/Food_service.dart';
import 'package:flutter_end/data/models/firebase/firebase_service.dart';
import 'package:flutter_end/data/models/firebase/hotel_service.dart';
import 'package:flutter_end/screens/all_screens/all_screens.dart';
import 'package:flutter_end/screens/home/widgets/header_item.dart';
import 'package:flutter_end/screens/home/widgets/home_app_bar.dart';
import 'package:flutter_end/screens/home/widgets/item_category.dart';
import 'package:flutter_end/screens/home/widgets/menu_navigation.dart';
import 'package:flutter_end/screens/home/widgets/search_field.dart';
import 'package:flutter_end/data/models/destination_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0; // Lưu trữ chỉ số của tab hiện tại
  final FirebaseService firebaseService = FirebaseService();
  final HotelService hotelService=HotelService();
  final EntertainmentService entertainmentService=EntertainmentService();
  final FoodService foodService=FoodService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onSearchChanged: (value) {
          debugPrint("Search text changed: $value");
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: SearchField(
                hintText: "Search Here",
                onChangd: (value) {
                  debugPrint("Search text changed: $value");
                },
              ),
            ),
            _buildTopNavigation(),
            // Nội dung thay đổi dựa trên tab được chọn
            Expanded(child: _getSelectedPageContent())
          ],
        ),
      ),
    );
  }

  // Tạo thanh điều hướng trên cùng với các tab
  Widget _buildTopNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem("Location", 0),
          _buildTabItem("Resort", 1),
          _buildTabItem("Entertainment", 2),
          _buildTabItem("Food", 3),
        ],
      ),
    );
  }

  // Xây dựng mỗi mục trong thanh điều hướng trên cùng
  Widget _buildTabItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: _selectedTab == index ? Colors.orange : Colors.black,
        ),
      ),
    );
  }

  // Trả về nội dung cho từng tab
  Widget _getSelectedPageContent() {
    switch (_selectedTab) {
      case 0:
        return _buildLocationContent();
      case 1:
        return _buildHotelsContent();
      case 2:
        return _buildEntertainment();
      case 3:
        return _buildFoodContent();
      default:
        return _buildLocationContent();
    }
  }
  // Nội dung của tab "Hotels"
  Widget _buildHotelsContent() {
    return StreamBuilder<List<DestinationModel>>(
      stream: hotelService.getHotels(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hotels found.'));
        }
        final destinations = snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            children: [
              HeaderItem(
                title: "Resort",
                onSeeAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllDestinationsScreen()),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    final location = destinations[index];
                    return GestureDetector(
                      child: ItemCategory(product: location),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  // Nội dung của tab "Location"

  // nội dung của tab " Location "
  Widget _buildLocationContent()
  {
    return StreamBuilder<List<DestinationModel>>(
      stream: firebaseService.getDestinations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hotels found.'));
        }

        final destinations = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            children: [
              HeaderItem(
                title: "Location",
                onSeeAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllDestinationsScreen()),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    final location = destinations[index];
                    return GestureDetector(
                      child: ItemCategory(product: location),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Nội dung của tab "Adventure"
  Widget _buildEntertainment()
  {
    return StreamBuilder<List<DestinationModel>>(
      stream: entertainmentService.getEntertainment(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Entertainment found.'));
        }

        final destinations = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            children: [
              HeaderItem(
                title: "Entertainment",
                onSeeAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllDestinationsScreen()),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    final location = destinations[index];
                    return GestureDetector(
                      child: ItemCategory(product: location),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Nội dung của tab "Food"
  Widget _buildFoodContent() {
    return StreamBuilder<List<DestinationModel>>(
      stream: foodService.getFoodServices(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Food found.'));
        }

        final destinations = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            children: [
              HeaderItem(
                title: "Entertainment",
                onSeeAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllDestinationsScreen()),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    final location = destinations[index];
                    return GestureDetector(
                      child: ItemCategory(product: location),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
