defmodule Edbot.Commands do
  alias Nostrum.Api
  alias Edbot.Helpers

  HTTPoison.start()

  def pong(channel_id) do
    Api.Message.create(channel_id, "Pong!")
  end

  def fetchPic(channel_id) do
    case HTTPoison.get("https://thispersondoesnotexist.com", [], follow_redirect: true) do
      {:ok, %HTTPoison.Response{status_code: 200, body: image_data}} ->
        Api.create_message(channel_id,
          file: %{
            name: "generated_person.jpg",
            body: image_data
          }
        )

      {:error, %HTTPoison.Error{reason: reason}} ->
        Api.create_message(channel_id, "Failed to fetch image: #{inspect(reason)}")
    end
  end

  def fetchCrime(channel_id) do
    page_number = :rand.uniform(10)

    case HTTPoison.get("https://api.fbi.gov/wanted/v1/list?page=#{page_number}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: crimes}} ->
        {:ok, parsed_json} = Jason.decode(crimes)
        crimes = parsed_json["items"]
        {criminal, reward} = Helpers.parse_crime_story(crimes)

        Api.Message.create(
          channel_id,
          """
          ## #{criminal}

          #{reward}
          """
        )

      {:error, %HTTPoison.Error{reason: reason}} ->
        Api.create_message(channel_id, "Failed to fetch crime story: #{inspect(reason)}")
    end
  end
end
