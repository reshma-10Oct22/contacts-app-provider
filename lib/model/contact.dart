class Contact {
  late bool? isFav;
  late int id;
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String emailId;

  Contact({
    this.isFav = false,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.emailId,
  });

  String getFullName() {
    return "$firstName $lastName";
  }

  @override
  String toString() {
    return "$id) $getFullName $phoneNumber $emailId $isFav";
  }
}
