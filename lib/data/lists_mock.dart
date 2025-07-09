import 'package:gallery_app/domain/models/album_model.dart';
import 'package:gallery_app/domain/models/photo_model.dart';

final List<AlbumModel> albums = [
  AlbumModel(
    id: '1',
    title: 'Férias de verão',
    numberOfPhotos: 34,
    createdAt: DateTime(2023, 6, 1),
    favorite: true,
  ),
  AlbumModel(
    id: '2',
    title: 'Aniversário da Maria',
    numberOfPhotos: 25,
    createdAt: DateTime(2023, 7, 15),
    favorite: false,
  ),
  AlbumModel(
    id: '3',
    title: 'Viagem à praia',
    numberOfPhotos: 18,
    createdAt: DateTime(2023, 8, 20),
    favorite: true,
  ),
];

final List<PhotoModel> photos = [
  PhotoModel(
    id: '1',
    path: 'assets/images/photo1.jpg',
    title: 'Foto de férias',
    createdAt: DateTime(2023, 6, 5),
  ),
  PhotoModel(
    id: '2',
    path: 'assets/images/photo2.jpg',
    title: 'Foto de aniversário',
    createdAt: DateTime(2023, 7, 10),
  ),
  PhotoModel(
    id: '3',
    path: 'assets/images/photo3.jpg',
    title: 'Foto de aniversário',
    createdAt: DateTime(2023, 7, 16),
  ),
  PhotoModel(
    id: '4',
    path: 'assets/images/photo4.jpg',
    title: 'Passeio no parque',
    createdAt: DateTime(2023, 8, 2),
  ),
  PhotoModel(
    id: '5',
    path: 'assets/images/photo5.jpg',
    title: 'Casamento dos amigos',
    createdAt: DateTime(2023, 9, 21),
  ),
  PhotoModel(
    id: '6',
    path: 'assets/images/photo6.jpg',
    title: 'Formatura',
    createdAt: DateTime(2023, 12, 15),
  ),
  PhotoModel(
    id: '7',
    path: 'assets/images/photo7.jpg',
    title: 'Natal em família',
    createdAt: DateTime(2023, 12, 25),
  ),
  PhotoModel(
    id: '8',
    path: 'assets/images/photo8.jpg',
    title: 'Réveillon na praia',
    createdAt: DateTime(2023, 12, 31),
  ),
  PhotoModel(
    id: '9',
    path: 'assets/images/photo9.jpg',
    title: 'Churrasco com amigos',
    createdAt: DateTime(2024, 1, 14),
  ),
  PhotoModel(
    id: '10',
    path: 'assets/images/photo10.jpg',
    title: 'Trilha na montanha',
    createdAt: DateTime(2024, 4, 5),
  ),
];
