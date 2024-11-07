import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_end/MyApp.dart';
import 'package:flutter_end/data/models/firebase/Entertainment.dart';
import 'package:flutter_end/data/models/firebase/Food_service.dart';
import 'package:flutter_end/data/models/firebase/firebase_service.dart';
import 'package:flutter_end/data/models/firebase/hotel_service.dart';
import 'package:flutter_end/firebase_options.dart';
// Nhập dịch vụ Firebase

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Khởi tạo FirebaseService
  final firebaseService = FirebaseService();
  final hotelservice = HotelService();
  final entertainment=EntertainmentService();
  final food=FoodService();
  // Thêm dữ liệu mẫu vào Firestore
  await firebaseService.addSampleDestinations();
  await hotelservice.addSampleHotels();
  await entertainment.addSampleEntertainment();
  await food.addSampleFoodServices();

  // Thêm dòng này để thêm dữ liệu mẫu

  runApp(const MyApp());
}
