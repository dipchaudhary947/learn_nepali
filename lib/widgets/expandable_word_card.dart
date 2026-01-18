import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_nepali/models/phrase_word.dart';

class ExpandableWordCard extends StatefulWidget {
  final PhraseWord word;
  final bool isFav;
  final VoidCallback onFavTap;
  final FlutterTts tts;

  /// ✅ Properly typed title builder
  final Widget Function(String text)? titleBuilder;

  const ExpandableWordCard({
    super.key,
    required this.word,
    required this.isFav,
    required this.onFavTap,
    required this.tts,
    this.titleBuilder, // optional
  });

  @override
  State<ExpandableWordCard> createState() => _ExpandableWordCardState();
}

class _ExpandableWordCardState extends State<ExpandableWordCard> {
  bool expanded = false;

  /// 🔊 Speak only when expanding
  Future<void> _onCardTap() async {
    final willExpand = !expanded;

    setState(() => expanded = willExpand);

    if (willExpand) {
      await widget.tts.stop();
      await widget.tts.speak(widget.word.nepali);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: _onCardTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔰 Top Row (Nepali + Star)
              Row(
                children: [
                  Expanded(
                    child: widget.titleBuilder != null
                        ? widget.titleBuilder!(widget.word.nepali)
                        : Text(
                            widget.word.nepali,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                  ),
                  IconButton(
                    icon: Icon(
                      widget.isFav ? Icons.star : Icons.star_border,
                      color: Colors.green,
                    ),
                    onPressed: widget.onFavTap,
                  ),
                ],
              ),

              if (expanded)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Divider(
                    thickness: 1,
                    color: Colors.green.shade100,
                  ),
                ),

              // 📖 Details
              if (expanded) ...[
                Text(
                  "Pronunciation: ${widget.word.pronunciation}",
                  style: const TextStyle(fontSize: 14),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Meaning: ${widget.word.meaning}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.volume_up, color: Colors.green),
                      onPressed: () {
                        widget.tts.stop();
                        widget.tts.speak(widget.word.nepali);
                      },
                    ),
                  ],
                ),

                Text(
                  "Thai: ${widget.word.thaiMeaning}",
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 6),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
