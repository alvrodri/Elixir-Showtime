defmodule MovieApp do
  use Application

  def restart() do
    IO.write "\e[H\e[J"; IEx.dont_display_result
    IO.puts(IO.ANSI.format([:bright, :green, "Elixir ", :red, "Showtime 🎬🚀\n", :reset]))
  end

  def start(_type, _args) do
    restart()

    IO.puts("Enter a movie name to get started:")
    movie_name = IO.gets("> ") |> String.trim()
    IO.puts("")
    MovieFetcher.fetch_movie_info(movie_name)
    {:ok, self()}
  end
end
