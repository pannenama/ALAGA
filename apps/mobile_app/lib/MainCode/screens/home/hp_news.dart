import 'package:flutter/material.dart';
//import '../../config/app_colors.dart';

class NewsSection extends StatelessWidget {
  final ScrollController controller;
  const NewsSection({super.key, required this.controller});

  static const _demoNews = [
    {
      "title": "New Digital Health ID rollout begins",
      "source": "Department of Health",
      "time": "3 hours ago",
      "snippet":
          "The Department of Health has started rolling out a unified digital health ID across pilot hospitals..."
    },
    {
      "title": "Data privacy updates explained",
      "source": "National Privacy Commission",
      "time": "2 days ago",
      "snippet":
          "New guidelines have been released to strengthen patient data protection across digital platforms..."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 18),
      children: [
        // ==================== NEW TO ALAGA CARD (SCROLLS) ====================
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          decoration: BoxDecoration(
            color: const Color(0xFF0E7A4E), // deep green
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "New to ALAGA?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Text(
                      "Tutorial",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Learn how MADA summarizes your records and\nhow MAPA finds care.",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Demo: Start Tour")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0E7A4E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                  ),
                  child: const Text(
                    "Start Tour",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ==================== CURRENT NEWS HEADER ====================
        Row(
          children: const [
            Icon(Icons.notifications_none, size: 26),
            SizedBox(width: 10),
            Text(
              "Current News",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // ==================== NEWS CARDS ====================
        ..._demoNews.map((n) => _NewsCard(
              title: n["title"]!,
              source: n["source"]!,
              time: n["time"]!,
              snippet: n["snippet"]!,
            )),

        const SizedBox(height: 12),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  final String title;
  final String source;
  final String time;
  final String snippet;

  const _NewsCard({
    required this.title,
    required this.source,
    required this.time,
    required this.snippet,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFEDEFF2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 14,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                source,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              snippet,
              style: const TextStyle(
                color: Color(0xFF374151),
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
