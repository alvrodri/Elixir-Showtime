defmodule MovieFetcher do
  @omdb_api_url "http://www.omdbapi.com"
  @jfper_api_url "https://jfper.link/movie"

  def fetch_movie_info(movie_name) do
    api_key = "da7c7bbd"
    movie_name = URI.encode(movie_name)
    url = "#{@omdb_api_url}/?apikey=#{api_key}&t=#{movie_name}"

    MovieApp.restart()

    :inets.start()
    case :httpc.request(:get, {to_charlist(url), []}, [], []) do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} ->
        body
        |> to_string()
        |> Jason.decode!()
        |> handle_omdb_response()

      {:error, reason} ->
        IO.puts(IO.ANSI.format([:red, "Failed to fetch movie info: #{inspect(reason)}"]))

      _ ->
        IO.puts(IO.ANSI.format([:red, "Failed to fetch movie info"]))
    end
  end

  defp handle_omdb_response(%{"imdbID" => imdb_id} = movie_info) do
    print_movie_info(movie_info)

    jfper_url = "#{@jfper_api_url}/#{imdb_id}"
    case :httpc.request(:get, {to_charlist(jfper_url), []}, [ssl: [verify: :verify_none]], []) do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} ->
        body
        |> to_string()
        |> Jason.decode!()
        |> handle_jfper_response()

      {:error, reason} ->
        IO.puts(IO.ANSI.format([:red, "Failed to fetch torrents for movie: #{inspect(reason)}"]))

      _ ->
        IO.puts(IO.ANSI.format([:red, "Failed to fetch torrents for movie"]))
    end
  end

  defp handle_jfper_response(%{"torrents" => %{"en" => torrents}}) do
    IO.puts(IO.ANSI.format([:magenta, "Available qualities:"]))

    Enum.each(torrents, fn {quality, info} ->
      IO.puts(IO.ANSI.format([
        :yellow, "#{quality} - File Size: ", :reset, info["filesize"]
      ]))
    end)

    IO.puts("\nEnter the desired quality (e.g., 1080p, 720p):")
    selected_quality = IO.gets("> ") |> String.trim()

    streaming_options = [
      "airplay", "Apple TV",
      "chromecast", "Chromecast",
      "mplayer", "MPlayer",
      "mpv", "MPV",
      "vlc", "VLC",
      "xbmc", "XBMC"
    ]

    IO.puts(IO.ANSI.format([:cyan, "\nAvailable streaming options (only if webtorrent is available):"]))

    Enum.chunk_every(streaming_options, 2)
    |> Enum.each(fn [option, description] ->
      IO.puts(IO.ANSI.format([:yellow, "#{option}: ", :reset, description]))
    end)

    IO.puts("\nSelect a streaming option (or press Enter for default VLC):")
    selected_option = IO.gets("> ") |> String.trim()

    case Map.get(torrents, selected_quality) do
      nil ->
        IO.puts(IO.ANSI.format([:red, "Invalid quality selected. Please try again."]))
        handle_jfper_response(%{"torrents" => %{"en" => torrents}})

      %{"url" => url} ->
        if selected_option == "" do
          MovieStreamer.open_torrent(url, "vlc")
        else
          IO.puts(IO.ANSI.format([:green, "Using streaming option: #{selected_option}"]))
          MovieStreamer.open_torrent(url, selected_option)
        end
    end
  end

  defp handle_jfper_response(_), do: IO.puts("No torrents available.")

  defp print_movie_info(%{"Title" => title, "Year" => year, "Plot" => plot}) do
    IO.puts(IO.ANSI.format([:green, "Title: ", :reset, title]))
    IO.puts(IO.ANSI.format([:blue, "Year: ", :reset, year]))
    IO.puts(IO.ANSI.format([:yellow, "Plot: ", :reset, plot]))
    IO.puts("")
  end
end
