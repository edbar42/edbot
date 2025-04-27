defmodule Edbot.Commands do
  alias Nostrum.Api
  HTTPoison.start()

  def pong(msg) do
    Api.Message.create(msg.channel_id, "Pong!")
  end

  def fetchPic(msg) do
    case HTTPoison.get("https://thispersondoesnotexist.com", [], follow_redirect: true) do
      {:ok, %HTTPoison.Response{status_code: 200, body: image_data}} ->
        Api.create_message(msg.channel_id,
          file: %{
            name: "generated_person.jpg",
            body: image_data
          }
        )

      {:error, %HTTPoison.Error{reason: reason}} ->
        Api.create_message(msg.channel_id, "Failed to fetch image: #{inspect(reason)}")
    end
  end
end
