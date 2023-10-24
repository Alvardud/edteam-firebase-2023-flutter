class Mensaje {
  final String? mensaje;
  final String? fecha;
  final String? tipo;
  final String? urlImagen;
  final String? usuarioDest;
  final String? usuariOrigen;
  final String id;

  Mensaje(this.id,
      {this.fecha,
      this.mensaje,
      this.tipo,
      this.urlImagen,
      this.usuarioDest,
      this.usuariOrigen});

  factory Mensaje.fromSnapshot(dynamic json, String id) {
    return Mensaje(id,
        fecha: json['fecha'],
        mensaje: json['mensaje'],
        tipo: json['tipo'],
        urlImagen: json['url_imagen'],
        usuariOrigen: json['usuario_origen'],
        usuarioDest: json['usuario_dest']);
  }
}
