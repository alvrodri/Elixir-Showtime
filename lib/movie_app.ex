defmodule MovieApp do
  use Application

  def start(_type, _args) do
    IO.write "\e[H\e[J"; IEx.dont_display_result
    IO.puts("Enter a movie name:")
    movie_name = IO.gets("> ") |> String.trim()
    IO.puts("")
    MovieFetcher.fetch_movie_info(movie_name)
    {:ok, self()}
  end
end
