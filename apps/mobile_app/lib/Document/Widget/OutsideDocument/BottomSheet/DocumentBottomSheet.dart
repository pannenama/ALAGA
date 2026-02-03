import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'LoadingScreen.dart';

class DocumentBottomSheet extends StatelessWidget {
  const DocumentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add New Document',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final ct = context;
              XFile? xfile = await picker.pickImage(source: ImageSource.camera);
              if (!ct.mounted) return;

              if (xfile != null) {

                showModalBottomSheet(
                  context: ct,
                  isDismissible: false,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const LoadingBottomSheet(),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFD9F5F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                    color: Color(0xFF0F766E),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scan with Camera',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F766E),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Capture a photo of your record',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final ct = context;
              XFile? xfile = await picker.pickImage(
                source: ImageSource.gallery,
              );
              if (!ct.mounted) return;
              if (xfile != null) {

                Navigator.push(
                  ct,
                  MaterialPageRoute(
                    builder: (_) =>  LoadingBottomSheet(),
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.upload_file_outlined,
                    size: 30,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload PDF/Image',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Select from your device storage',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}