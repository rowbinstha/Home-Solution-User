class Technician {
  final String email;
  final String fullname;
  final String contact;

  Technician(
      {required this.email, required this.fullname, required this.contact});

  factory Technician.fromJson(Map<String, dynamic> json) {
    return Technician(
      fullname: json['fullname'],
      email: json['email'],
      contact: json['contact'],
    );
  }

  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'email': email,
        'contact': contact,
      };
}
