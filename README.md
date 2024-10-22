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
To get started with **TorrentShowtime**, ensure you have [Elixir](https://elixir-lang.org/install.html) and [WebTorrent](https://webtorrent.io/) installed on your system.

### Prerequisites  
1. **Elixir**  
   Install Elixir by following the [official instructions](https://elixir-lang.org/install.html).  
2. **WebTorrent**  
   Install WebTorrent globally using npm:  
   ```bash
   npm install -g webtorrent
3. **VLC Player**
   Download VLC media player from here.

## Clone and Setup
```bash
git clone https://github.com/your_username/torrentshowtime.git
cd torrentshowtime
```

## Running the Application
```bash
mix run
```

You'll be prompted to enter a movie name, select a torrent quality, and the torrent will start streaming directly to VLC.

## Usage 📽️

```bash
Enter a movie name: The Fall Guy
Fetching movie info...
Available qualities:
- 720p - File Size: 1.14 GB
- 1080p - File Size: 2.34 GB
- 2160p - File Size: 5.64 GB
Enter the desired quality (e.g., 1080p): 1080p
You selected 1080p. Streaming the torrent...
```

## Future Features 🔮

- Support for more media players
- Enhanced user interface
- More torrent sources
  
## License 📝
This project is licensed under the MIT License - see the LICENSE file for details.