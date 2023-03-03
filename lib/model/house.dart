import 'dart:core';

import 'dart:core';

class House {
  String name;
  String address;
  String imageUrl;
  String SubAdress;
  String cabir;
  String lacag;
  String bedroom;
  String kitchen;
  String bathroom;
  String toilet;
  String whole;
  String parking;

  House(this.name, this.address, this.imageUrl, this.SubAdress,this.cabir,this.lacag,this.bedroom,this.kitchen,this.bathroom,this.parking,this.toilet,this.whole);

  static List<House> generatedRecomended() {
    return [
      House(
          "Guri Dabaq ah", "Waaberi", "assets/images/d7.jpg", "Maajo", "13×13 M","\$ 1000","5 bedroom","2 kitchen","2 bathroom", "1 parking","1 Medium Whole","2 Tiolet"),
      House(
          "Guri Dabaq ah", "Hodan", "assets/images/d8.jpg", "AbdiQasim", "14×14 M","\$ 2000","6 bedroom","2 kitchen","2 bathroom", "2 parking","1 large Whole","3 Tiolet"),
      House(
          "Guri Dabaq ah", "AbdiAziz", "assets/images/d3.jpg", "Janaraal Da'ud", "13×14 M","\$ 1500","4 bedroom","2 kitchen","1 bathroom", "2 parking","1 meeting whole","2 Toilet"),
      House(
          "Guri Dabaq ah", "Holwadaag", "assets/images/d4.jpg", "Sayidka", "14×14 M","\$ 3000","8 bedroom","3 kitchen","3 bathroom", "2 parking","2 Medium Whole","4 Toilet"),
      House(
          "Guri Dabaq ah", "wadajir", "assets/images/d5.jpg", "Jaale siyaad", "14×14 M","\$ 800","5 bedroom","2 kitchen","2 bathroom", "2 parking","1 Medium Whole","2 Toilet"),
      House(
          "Guri Dabaq ah", "Boondheere", "assets/images/d6.jpg", "Darjiinka", "12×12 M","\$ 1500"," 7 bedroom","2 kitchen","2 bathroom", "1 parking","1 Whole","2 Toilet"),
    ];
  }

  static List<House> generatedBestOffer() {
    return [
      House(
          "Guri villa ah", "Waaberi", "assets/images/d7.jpg", "Maajo", "500 sqft","\$ 800","2 bedroom","2 kitchen","1 bathroom", "2 parking","",""),
      House(
          "Guri villa ah", "Hodan", "assets/images/d8.jpg", "AbdiQasim", "500 sqft","\$ 400","2 bedroom","2 kitchen","1 bathroom", "2 parking","",""),
      House(
          "Guri villa ah", "AbdiAziz", "assets/images/d3.jpg", "Janaraal Da'ud", "500 sqft","\$ 200","2 bedroom","2 kitchen","1 bathroom", "2 parking","",""),
      House(
          "Guri villa ah", "Holwadaag", "assets/images/d4.jpg", "Sayidka", "500 sqft","\$ 700","2 bedroom","2 kitchen","1 bathroom", "2 parking","",""),
      House(
          "Guri villa ah", "Waaberi", "assets/images/d5.jpg", "Dabka", "500 sqft","\$ 900","2 bedroom","2 kitchen","1 bathroom", "2 parking","",""),
      House(
          "Guri villa ah", "Boondheere", "assets/images/d6.jpg", "Tiyaatarka", "500 sqft","\$ 560","2 bedroom","2 kitchen","1 bathroom", "2 parking","",""),

    ];
  }

  static List<House> generatedbacweyne() {
    return [
      House(
          "Guri bacwayna ah", "Hodan", "assets/images/j1.jpg", "taarabuunka", "12 x 12 M","\$ 100","4 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
      House(
          "Guri bacwayna ah", "Hodan", "assets/images/j2.jpg", "cusbitalka_xooga", "10 x 14 M","\$ 150","5 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
      House(
          "Guri bacwayna ah", "dayniile", "assets/images/j3.jpg", "gubta", "10 x 10 M","\$ 200","5 rooms","1 kitchen","no bathroom ", " no parking" ," ","1 Tiolet"),
      House(
          "Guri bacwayna ah", "yaqshid", "assets/images/j4.jpg", "tulada_ciyaraha", "10 x 10 M","\$ 110","4 rooms","1 kitchen","no bathroom ", " no parking" ,"","1 Tiolet"),
      House(
          "Guri bacwayna ah", "xamar_jajab", "assets/images/j5.jpg", "buundada", "12 x 12 M","\$ 120","5 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
      House(
          "Guri bacwayna ah", "dayniile", "assets/images/j6.jpg", "Weedow", "13 x 13 M","\$ 80","4 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
    ];
  }
  static List<House> generatedbestbacweyne() {
    return [
      House(
          "Guri bacweyne ah", "Hodan", "assets/images/j1.jpg", "taarabuunka", "12 x 12 M","\$ 100","4 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
      House(
          "Guri bacweyne ah", "Hodan", "assets/images/j2.jpg", "cusbitalka_xooga", "10 x 14 M","\$ 150","5 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
      House(
          "Guri bacweyne ah", "dayniile", "assets/images/j3.jpg", "gubta", "10 x 10 M","\$ 200","5 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
      House(
          "Guri bacweyne ah", "yaqshid", "assets/images/j4.jpg", "tulada_ciyaraha", "10 x 10 M","\$ 110","4 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
      House(
          "Guri bacweyne ah", "xamar_jajab", "assets/images/j5.jpg", "buundada", "12 x 12 M","\$ 120","5 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
      House(
          "Guri bacweyne ah", "dayniile", "assets/images/j6.jpg", "Weedow", "13 x 13 M","\$ 80","4 rooms","1 kitchen","no bathroom ", " no parking"," ","1 Tiolet"),
    ];
  }
  static List<House> generatedvilloList() {
    return [
      House(
          "Guri Villa ah", "dharkenlay", "assets/images/v1.jpg", "suuqliif", "20×20 M","\$ 500","8 bedroom","2 kitchen","1 bathroom", "2 parking","","3 Tiolet"),
      House(
          "Guri Villa ah", "Xamar Weyne", "assets/images/v2.jpg", "V_Roma", "13×15 M","\$ 450","6 bedroom","2 kitchen","1 bathroom", "2 parking","","2 Tiolet"),
      House(
          "Guri Villa ah", "Wadajir", "assets/images/v3.jpg", "BuulaXubey", "12×12 M","\$ 350","4 bedroom","1 kitchen","1 bathroom", "1 parking","","2 Tiolet"),
      House(
          "Guri Villa ah", "Wardhiigley", "assets/images/v4.jpg", "15 May", "14×14 M","\$ 480","5 bedroom","2 kitchen","1 bathroom", "1 parking","","2 Tiolet"),
      House(
          "Guri Villa ah", "Waaberi", "assets/images/v5.jpg", "V Liberia", "15×16 M","\$ 420","7 bedroom","2 kitchen","1 bathroom", "2 parking","","3 Tiolet"),
      House(
          "Guri Villa ah", "Holwadaag", "assets/images/v6.jpg", "BlacSea", "14×16 M","\$ 380","6 bedroom","1 kitchen","1 bathroom", "1 parking","","2 Tiolet"),
    ];
  }

  static List<House> generatedBestVillo() {
    return [
      House(
          "Guri Villa ah", "dharkenlay", "assets/images/v1.jpg", "suuqliif", "20×20 M","\$ 500","8 bedroom","2 kitchen","1 bathroom", "2 parking","","3 Tiolet"),
      House(
          "Guri Villa ah", "Xamar Weyne", "assets/images/v2.jpg", "V_Roma", "13×15 M","\$ 450","6 bedroom","2 kitchen","1 bathroom", "2 parking","","2 Tiolet"),
      House(
          "Guri Villa ah", "Wadajir", "assets/images/v3.jpg", "BuulaXubey", "12×12 M","\$ 350","4 bedroom","1 kitchen","1 bathroom", "1 parking","","2 Tiolet"),
      House(
          "Guri Villa ah", "Wardhiigley", "assets/images/v4.jpg", "15 May", "14×14 M","\$ 480","5 bedroom","2 kitchen","1 bathroom", "1 parking","","2 Tiolet"),
      House(
          "Guri Villa ah", "Waaberi", "assets/images/v5.jpg", "V Liberia", "15×16 M","\$ 420","7 bedroom","2 kitchen","1 bathroom", "2 parking","","3 Tiolet"),
      House(
          "Guri Villa ah", "Holwadaag", "assets/images/v6.jpg", "BlacSea", "14×16 M","\$ 380","6 bedroom","1 kitchen","1 bathroom", "1 parking","","2 Tiolet"),
    ];
  }
}
