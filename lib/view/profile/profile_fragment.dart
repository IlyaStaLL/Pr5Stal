import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../inherited/user_inherited.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  final List<String> _imageUrls = [
    'https://fastly.picsum.photos/id/1054/200/200.jpg?hmac=7QHudGoyKxdWVPcUelySqBkngm7Xl76Lba9cE0uag_o',
    'https://fastly.picsum.photos/id/1002/200/200.jpg?hmac=iF8HlQ9ThNnr5_00WjQuQXmZ4JYS32pdfOX8bjDHfC_g',
    'https://fastly.picsum.photos/id/937/200/200.jpg?hmac=8EPB28CQ2KANQ2nsQXz4GA-tQ6YTCG1MqZENbDsimdQ',
    'https://fastly.picsum.photos/id/842/200/200.jpg?hmac=RW9iEAYLKWoinQWSz_ZrHyOxmVVEGgvoZtPebkRGMmI',
    'https://fastly.picsum.photos/id/1009/200/200.jpg?hmac=2D10SfAyIifJZL4JP_Z_LZmzi_zjA89WCntIJGjdIGE',
  ];

  int _currentImageIndex = 0;

  void _changeImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userInherited = UserInherited.of(context);
    final userName = userInherited?.user.name ?? 'Гость';
    final userEmail = userInherited?.user.email ?? '';

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFF00D3E6),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: _imageUrls[_currentImageIndex],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const CircularProgressIndicator(
                      color: Colors.black,
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                userName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                userEmail,
                style: const TextStyle(color: Color(0xFF8B8B8B)),
              ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFFFFF)),
                ),
                child: const ListTile(
                  leading: Icon(Icons.info_outline, color: Color(0xFF00D3E6)),
                  title: Text(
                    'Информация профиля',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    'Статистика, данные, активность',
                    style: TextStyle(color: Color(0xFF8B8B8B)),
                  ),
                  onTap: null,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D3E6), Color(0xFF3FCEAFF)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: _changeImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Выйти из аккаунта',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}