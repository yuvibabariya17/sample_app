class ListModel {
  String name;
  String title;
  String discription;
  String phoneNumber;

  ListModel(
      {required this.name,
      required this.title,
      required this.discription,
      required this.phoneNumber});
}

List<ListModel> itemList = [
  ListModel(
      name: "Yuvi",
      title: "Flutter Developer",
      discription: "1 year Experience",
      phoneNumber: "92654499654"),
  ListModel(
      name: "Justin",
      title: "Flutter Developer",
      discription: "3 year Experience",
      phoneNumber: "92654499654"),
  ListModel(
      name: "Sachin",
      title: "Full Stack Developer",
      discription: "5 year Experience",
      phoneNumber: "92654499654"),
  ListModel(
      name: "Ashwini",
      title: "UI/UX Designer",
      discription: "2 year Experience",
      phoneNumber: "92654499654"),
  ListModel(
      name: "Bhoomi",
      title: "BackEnd Developer",
      discription: "5 year Experience",
      phoneNumber: "92654499654"),
];
