import 'package:flutter/material.dart';
import 'constants.dart';

class BookContent {
  static List<BookModel> bookList = [
    BookModel(
        bookImage: 'assets/images/display_book1.jpg',
        bookName: 'Rich Dad Poor Dad',
        bookAuthor: 'Robert Kiyosaki',
        bookPrice: '\$20'),
    BookModel(
        bookImage: 'assets/images/display_book2.jpg',
        bookName: 'Think And Grow Rich',
        bookAuthor: 'Napolean Hill',
        bookPrice: '\$20'),
    BookModel(
        bookImage: 'assets/images/display_book3.jpg',
        bookName: 'The Sword Of Summer',
        bookAuthor: 'Rick Riordan',
        bookPrice: '\$20'),
    BookModel(
        bookImage: 'assets/images/display_book4.jpg',
        bookName: 'The Lean Startup',
        bookAuthor: 'Eric Ries',
        bookPrice: '\$20'),
    BookModel(
        bookImage: 'assets/images/display_book5.jpg',
        bookName: 'The 4-Hour WorkWeek',
        bookAuthor: 'Timothy Ferriss',
        bookPrice: '\$20'),
    BookModel(
        bookImage: 'assets/images/display_book6.jpg',
        bookName: 'The \$100 Startup',
        bookAuthor: 'Timothy Ferriss',
        bookRating: Row(),
        bookPrice: '\$20'),
    BookModel(
        bookImage: 'assets/images/display_book7.jpg',
        bookName: 'The Power Of Habit',
        bookAuthor: 'Timothy Ferriss',
        bookPrice: '\$20'),
    BookModel(
        bookImage: 'assets/images/display_book8.jpg',
        bookName: 'Business Plan Template',
        bookAuthor: 'Timothy Ferriss',
        bookPrice: '\$20'),
    // BookModel(bookImage: 'assets/images/display_book9.jpg'),
    // BookModel(bookImage: 'assets/images/display_book10.jpg'),
    // BookModel(bookImage: 'assets/images/display_book11.jpg'),
    // BookModel(bookImage: 'assets/images/display_book12.jpg'),
    // BookModel(bookImage: 'assets/images/display_book13.jpg'),
    // BookModel(bookImage: 'assets/images/display_book14.jpg'),
    // BookModel(bookImage: 'assets/images/display_book15.jpg'),
  ];
}

class BookModel {
  BookModel(
      {this.bookImage,
      this.bookName,
      this.bookAuthor,
      this.bookRating,
      this.bookPrice});
  final String? bookImage;
  final String? bookName;
  final String? bookAuthor;
  final String? bookPrice;
  final Row? bookRating;
}
