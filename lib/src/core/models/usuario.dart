class Usuario {
  final String? nombre;
  final String? apellidos;
  final String? profesion;
  final int? edad;
  final String id;

  Usuario(this.id, {this.apellidos, this.edad, this.nombre, this.profesion});

  factory Usuario.fromSnapshot(dynamic json, String id) {
    return Usuario(id,
        apellidos: json['apellidos'],
        edad: int.parse(json['edad'].toString()),
        nombre: json['nombre'],
        profesion: json['profesion']);
  }
}
