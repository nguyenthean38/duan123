import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_end/data/models/destination_model.dart';

class FoodService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a food service to Firestore
  Future<void> addFoodService(DestinationModel foodService) async {
    try {
      await _firestore.collection('Food').doc(foodService.id).set(foodService.toJson());
      print('Successfully added food service with id: ${foodService.id}');
    } catch (e) {
      print('Error adding food service with id: ${foodService.id}: $e');
    }
  }

  // Add sample food services to Firestore if they don't already exist
  Future<void> addSampleFoodServices() async {
    final List<DestinationModel> sampleFoodServices = [
      DestinationModel(
        id: '18',
        name: 'Phở Hà Nội',
        imageUrl: 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/01-le/top-8-dac-san-viet-nam/hinh-1-pho-la-mon-an-truyen-thong-va-lau-doi-cua-thu-do.jpg',
        rating: 4.0,
        reviewsCount: 120,
        description: 'Phở là một trong những món ngon Việt Nam lâu đời nhất tại Hà Nội. Phở Việt Nam, đặc biệt  là Phở Hà Nội đã từng lọt vào danh sách 50 món ngon thế giới do CNN bình chọn vào tháng 3/2018. Với bàn tay khéo léo của những người chế biến lâu năm, các nguyên liệu tưởng chừng dân dã và quen thuộc như bún gạo, nước dùng, thịt bò hay thịt gà, các loại rau gia vị,... được hòa quyện với nhau tạo nên một hương vị hài hòa và vẹn tròn.',
        facilities: {
          'Internet': true,
          'Parking': false,
          'Spa': false,
          'Swimming Pool': false,
        },
        price: 20000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      DestinationModel(
        id: '19',
        name: 'Gỏi Cuốn Sài Gòn',
        imageUrl: 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/01-le/top-8-dac-san-viet-nam/hinh-7-goi-cuon-sai-gon-thom-ngon-la-mieng.jpg',
        rating: 4.0,
        reviewsCount: 120,
        description: 'Món gỏi cuốn đơn giản với phong phú các nguyên liệu đi kèm khiến người ăn cứ muốn thưởng thức hoài không chán. Gỏi cuốn gồm có bánh tráng, bánh mướt, tôm luộc bóc vỏ, thịt ba chỉ, các loại rau thơm, xà lách, dưa chuột,... cuốn lại với nhau rồi ăn với nước chấm.',
        facilities: {
          'Internet': false,
          'Parking': false,
          'Spa': false,
          'Swimming Pool': false,
        },
        price: 20000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),

      DestinationModel(
        id: '20',
        name: 'Cơm Tấm Sài Gòn',
        imageUrl: 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/01-le/top-8-dac-san-viet-nam/hinh-8-com-tam-sai-gon-la-mon-an-dan-da-cua-nguoi-dan-sai-thanh.jpg',
        rating: 4.0,
        reviewsCount: 120,
        description: 'Cơm tấm Sài Gòn thường ăn kèm cùng với một số các món ăn mặn như sườn nướng, chả, bì, trứng ốp la,... Cơm tấm Sài Gòn vàng giòn, bốc khói nghi ngút được chế biến công phu kèm với miếng thịt sườn đậm đà hay sợi chả, bì dai ngon chính là cảm giác vô cùng ấn tượng khi thưởng thức món ăn này.',
        facilities: {
          'Internet': true,
          'Parking': false,
          'Spa': false,
          'Swimming Pool': false,
        },
        price: 25000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      DestinationModel(
        id: '21',
        name: 'Bánh Đa Cua Hải Phòng',
        imageUrl: 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/01-le/top-8-dac-san-viet-nam/hinh-2-banh-da-cua-la-mon-an-san-sinh-tu-vung-dat-hai-phong.jpg',
        rating: 4.0,
        reviewsCount: 120,
        description: 'Một bát bánh đa cua Hải Phòng vừa hài hòa về màu sắc, hương vị lẫn nguyên liệu. Màu nâu sậm của bánh đa, màu gạch của cua âu hồng, màu xanh của rau muống, lá lốt, màu đỏ của ớt tươi, vàng đượm của hành khô phi vàng,... tất cả tạo nên một món ngon Việt Nam vô cùng hoàn hảo..',
        facilities: {
          'Internet': true,
          'Parking': false,
          'Spa': false,
          'Swimming Pool': false,
        },
        price: 30000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),


    ];

    for (final foodService in sampleFoodServices) {
      try {
        await addFoodService(foodService);
      } catch (e) {
        print('Error adding sample food service with id: ${foodService.id}: $e');
      }
    }
  }

  // Retrieve the list of food services from Firestore
  Stream<List<DestinationModel>> getFoodServices() {
    return _firestore.collection('Food').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DestinationModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
