class OnBoardingItem {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingItem({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

const List<OnBoardingItem> onBoardingItems = [
  OnBoardingItem(
    title: 'Cards',
    subTitle: 'All your cards in one place!',
    image: 'assets/images/on-boarding-1.png',
  ),
  OnBoardingItem(
    title: 'Transactions',
    subTitle: 'Send payments quickly and easily!',
    image: 'assets/images/on-boarding-2.png',
  ),
  OnBoardingItem(
    title: 'Insights',
    subTitle: 'View your transaction history!',
    image: 'assets/images/on-boarding-3.png',
  ),
];
