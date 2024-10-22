# Elixir Showtime 🎬🚀  

[![Elixir](https://img.shields.io/badge/Made%20with-Elixir-4B275F.svg?style=for-the-badge&logo=elixir)](https://elixir-lang.org)  
[![WebTorrent](https://img.shields.io/badge/Powered%20by-WebTorrent-DD4B39?style=for-the-badge&logo=webtorrent)](https://webtorrent.io/)  
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)  

**Elixir Showtime** is a lightweight command-line tool built in Elixir that lets you instantly search for movies, select torrent qualities, and stream them directly to VLC using WebTorrent. Fetch movie info from OMDB, and stream torrents from your terminal with ease.  

## Features 🛠️  
- 🎥 **Fetch movie details** from OMDB by entering the movie name  
- 🎬 **View torrent qualities** (720p, 1080p, 2160p) from an additional API 
- 🔗 **Stream torrents** directly using WebTorrent and VLC  
- 💻 Simple, easy-to-use command-line interface  

## Installation 📦  
To get started with **Elixir Showtime**, ensure you have [Elixir](https://elixir-lang.org/install.html) and [WebTorrent](https://webtorrent.io/) installed on your system.

### Prerequisites  
1. **Elixir**  
   Install Elixir by following the [official instructions](https://elixir-lang.org/install.html).  

2. **WebTorrent (optional, for better streaming)**
   Install WebTorrent globally using npm:  
   ```bash
   npm install -g webtorrent webtorrent-cli
   ```

3. **VLC Player (default player if webtorrent is not available)**

   Download VLC media player from [here](https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe).

## Clone and Setup
```bash
git clone https://github.com/alvrodri/elixir-showtime.git
cd Elixir-Showtime
```

## Running the Application
```bash
mix run
```

You'll be prompted to enter a movie name, select a torrent quality, and the torrent will start streaming directly to VLC/Webtorrent.

## Usage 📽️

```bash
Elixir Showtime 🎬🚀

Enter a movie name to get started:
> A star is born

Title: A Star Is Born
Year: 2018
Plot: A musician helps a young singer find fame as age and alcoholism send his own career into a downward spiral.

Available qualities:
1080p - File Size: 2.17 GB
2160p - File Size: 6.52 GB
720p - File Size: 1.13 GB

Enter the desired quality (e.g., 1080p, 720p):
> 720p

Available streaming options (only if webtorrent is available):
airplay: Apple TV
chromecast: Chromecast
mplayer: MPlayer
mpv: MPV
vlc: VLC
xbmc: XBMC

Select a streaming option (or press Enter for default VLC):
> ...
```

## Future Features 🔮

- Support for more media players
- Enhanced user interface
- More torrent sources
  
## License 📝
This project is licensed under the MIT License - see the LICENSE file for details.
