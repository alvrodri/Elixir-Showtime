defmodule MovieApp do
  use Application

  def start(_type, _args) do
    IO.puts("Enter a movie name:")
    movie_name = IO.gets("> ") |> String.trim()
    MovieFetcher.fetch_movie_info(movie_name)
    {:ok, self()}
  end
end
