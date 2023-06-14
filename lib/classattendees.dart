import 'dart:convert';

class Attendee {
  num id;
  String name;
  String description;
  String status;
  bool checked;
  Attendee({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.checked,
  });

  Attendee copyWith({
    num? id,
    String? name,
    String? description,
    String? status,
    bool? checked,
  }) {
    return Attendee(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      checked: checked ?? this.checked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'status': status,
      'checked': checked,
    };
  }

  factory Attendee.fromMap(Map<String, dynamic> map) {
    return Attendee(
      id: map['id'] as num,
      name: map['name'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      checked: map['checked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Attendee.fromJson(String source) =>
      Attendee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Attendee(id: $id, name: $name, description: $description, status: $status, checked: $checked)';
  }

  @override
  bool operator ==(covariant Attendee other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.status == status &&
        other.checked == checked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        status.hashCode ^
        checked.hashCode;
  }


}
