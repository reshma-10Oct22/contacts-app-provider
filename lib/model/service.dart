import 'contact.dart';

class ContactService {
  List<Contact> contactList = [];

  List<Contact> addContact() {
    Contact contact1 = Contact(
      id: 1,
      firstName: "Reshma",
      lastName: "Suresh",
      phoneNumber: "122121212",
      emailId: "rs@gmail.com",
      isFav: true,
    );
    Contact contact2 = Contact(
      id: 2,
      firstName: "Sushma",
      lastName: "Suresh",
      phoneNumber: "2121212121",
      emailId: "ss@gmail.com",
      isFav: true,
    );
    Contact contact3 = Contact(
      id: 3,
      firstName: "Hema",
      lastName: "Suresh",
      phoneNumber: "2125512121",
      emailId: "hs@gmail.com",
      isFav: true,
    );
    Contact contact4 = Contact(
      id: 4,
      firstName: "Kalyani",
      lastName: "Srni",
      phoneNumber: "2121214565",
      emailId: "ks@gmail.com",
    );
    Contact contact5 = Contact(
      id: 5,
      firstName: "Mythili",
      lastName: "Sridhar",
      phoneNumber: "2121216865",
      emailId: "ms@gmail.com",
    );
    Contact contact6 = Contact(
      id: 6,
      firstName: "Suresh",
      lastName: "Narayana",
      phoneNumber: "4568934563",
      emailId: "sn@gmail.com",
      isFav: true,
    );
    Contact contact7 = Contact(
      id: 7,
      firstName: "Booma",
      lastName: "Nattu",
      phoneNumber: "2121212121",
      emailId: "bn@gmail.com",
    );
    Contact contact8 = Contact(
      id: 8,
      firstName: "Vidya",
      lastName: "Jay",
      phoneNumber: "9797212121",
      emailId: "vj@gmail.com",
    );
    Contact contact9 = Contact(
      id: 9,
      firstName: "Prabu",
      lastName: "Hala",
      phoneNumber: "5889212121",
      emailId: "ph@gmail.com",
    );
    Contact contact10 = Contact(
      id: 10,
      firstName: "Aakash",
      lastName: "Srini",
      phoneNumber: "5889215065",
      emailId: "as@gmail.com",
    );
    contactList.addAll([
      contact1,
      contact2,
      contact3,
      contact4,
      contact5,
      contact6,
      contact7,
      contact8,
      contact9,
      contact10,
    ]);
    return contactList;
  }

  List<Contact> getContactList() {
    return contactList;
  }
}
