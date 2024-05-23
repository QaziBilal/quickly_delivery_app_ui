// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quickly_delivery_man/src/utils/icons.dart';

class MenuIconsModel {
  String icons;
  String title;
  MenuIconsModel({
    required this.icons,
    required this.title,
  });
}

List<MenuIconsModel> iconsList = [
  MenuIconsModel(icons: kIconMapFind, title: "Drop Me"),
  MenuIconsModel(icons: kIconFast, title: "Shipping"),
  MenuIconsModel(icons: kIconknife, title: "Restaurants"),
  MenuIconsModel(icons: kIconCoffee, title: "Cafe"),
  MenuIconsModel(icons: kIconBread, title: "Bakrey"),
  MenuIconsModel(icons: kIconOrangeJuice, title: "Juices"),
  MenuIconsModel(icons: kIconButcher, title: "Buchters & poultry"),
  MenuIconsModel(icons: kIconMedicine, title: "Pharmacies"),
  MenuIconsModel(icons: kIconPencil, title: "Stationary"),
  MenuIconsModel(icons: kIconMakeup, title: "Beauty"),
  MenuIconsModel(icons: kIconFlower, title: "Gift & Flower"),
  MenuIconsModel(icons: kIconDress, title: "Fashion"),
  MenuIconsModel(icons: kIconTechnology, title: "Technology"),
  MenuIconsModel(icons: kIconSport, title: "Sports"),
  MenuIconsModel(icons: kIconKitchen, title: "Kitchen"),
  MenuIconsModel(icons: kiconHeartBeat, title: "Health"),
  MenuIconsModel(icons: kIconBoiled, title: "Roastereis"),
  MenuIconsModel(icons: kIconShoppingCart, title: "Super Market"),
  MenuIconsModel(icons: kIcondots, title: "Other"),
];

List<MenuIconsModel> socialIconsList = [
  MenuIconsModel(icons: kIconFacebook, title: "Facebook"),
  MenuIconsModel(icons: kIconYoutube, title: "Youtube"),
  MenuIconsModel(icons: kIconTelegram, title: "Telegram"),
  MenuIconsModel(icons: kIconWWW, title: "Website"),
  MenuIconsModel(icons: kIconWhatsApp, title: "Whatsapp"),
  MenuIconsModel(icons: kIconTwitter, title: "Twitter"),
];

class CarTypesModel {
  String image;
  String title;
  String petrol;
  String seats;
  CarTypesModel({
    required this.image,
    required this.title,
    required this.petrol,
    required this.seats,
  });
}

List<CarTypesModel> carTypeList = [
  CarTypesModel(
      image: kIconCarHatchback,
      title: "First Class",
      petrol: "60 LE",
      seats: "4"),
  CarTypesModel(
      image: kIconSedanCarModel,
      title: "First Class",
      petrol: "50 LE",
      seats: "4"),
  CarTypesModel(
      image: kIconCar, title: "First Class", petrol: "40 LE", seats: "4"),
  CarTypesModel(
      image: kIconMotorbike, title: "First Class", petrol: "30 LE", seats: "1"),
];
