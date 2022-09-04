class RopedSongCard extends StatelessWidget {
  const RopedSongCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipInX(
      duration: Duration(milliseconds: _animDuration),
      child: up.Tied(
        minAngle: -0.01,
        maxAngle: 0.01,
        random: _random,
        child: up.SongCard(
          song: songs[index],
          onTap:
              onSelectSong != null ? () => onSelectSong!(songs, index) : null,
        ),
      ),
    );
  }
}
