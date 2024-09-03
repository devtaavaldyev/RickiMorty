// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CharactersEntity extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final ObjectEntity? origin;
  final ObjectEntity? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;
  const CharactersEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}

class ObjectEntity {
  final String name;
  final String url;
  ObjectEntity(
    this.name,
    this.url,
  );
}
