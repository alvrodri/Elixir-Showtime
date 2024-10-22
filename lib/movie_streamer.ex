defmodule MovieStreamer do
  def open_torrent_in_vlc(torrent_url) do
    case :os.type() do
      {:win32, _} ->
        System.cmd("cmd", ["/c", "start", "vlc", torrent_url])

      {:unix, :linux} ->
        System.cmd("vlc", [torrent_url])

      {:unix, :darwin} ->
        System.cmd("open", ["/Applications/VLC.app", "--args", torrent_url])

      _ ->
        IO.puts("Unsupported OS")
    end
  end
end
