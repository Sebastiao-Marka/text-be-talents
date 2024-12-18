class Usuario {
  final int id;
  final String name;
  final String job;
  final String admission_date;
  final String phone;
  final String image;
  late final bool detalhes;

  Usuario({
    required this.id,
    required this.name,
    required this.job,
    required this.admission_date,
    required this.phone,
    required this.image,
    required this.detalhes,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    Usuario usuario = Usuario(
      id: json["id"],
      name: json["name"],
      job: json["job"],
      admission_date: json["admission_date"],
      phone: json["phone"],
      image: json["image"],
      detalhes: false,
    );
    return usuario;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "job": job,
        "admission_date": admission_date,
        "phone": phone,
        "image": image,
        "detalhes": detalhes,
      };
}
