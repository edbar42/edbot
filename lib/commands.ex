defmodule Edbot.Commands do
  alias Nostrum.Api
  alias Edbot.Helpers

  HTTPoison.start()

  def fetchPic(channel_id) do
    case HTTPoison.get("https://thispersondoesnotexist.com", [], follow_redirect: true) do
      {:ok, %HTTPoison.Response{status_code: 200, body: image_data}} ->
        Api.Message.create(channel_id,
          file: %{
            name: "generated_person.jpg",
            body: image_data
          }
        )

      {:error, %HTTPoison.Error{reason: reason}} ->
        Api.Message.create(channel_id, "Failed to fetch image: #{inspect(reason)}")
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
        Api.Message.create(channel_id, "Failed to fetch crime story: #{inspect(reason)}")
    end
  end

  def fetchQuote(channel_id) do
    case HTTPoison.get("https://api.breakingbadquotes.xyz/v1/quotes") do
      {:ok, %HTTPoison.Response{status_code: 200, body: quote}} ->
        {:ok, parsed_json} = Jason.decode(quote)
        quote = parsed_json |> List.first()
        text = quote["quote"]
        author = quote["author"]

        Api.Message.create(
          channel_id,
          """
          > *#{text}*
          > **\\- #{author}**
          """
        )

      {:error, %HTTPoison.Error{reason: reason}} ->
        Api.Message.create(channel_id, "Failed to fetch Breaking Bad quote: #{inspect(reason)}")
    end
  end

  def fetchImposto(channel_id) do
    case HTTPoison.get(
           "https://impostometro.com.br/Contador/Municipios?estado=ce&municipio=fortaleza"
         ) do
      {:ok, %HTTPoison.Response{status_code: 200, body: imposto}} ->
        {:ok, parsed_json} = Jason.decode(imposto)

        valor =
          parsed_json["Valor"]
          |> Number.Currency.number_to_currency(unit: "R$", delimiter: ".", separator: ",")

        Api.Message.create(
          channel_id,
          """
          Neste ano Fortaleza arrecadou **#{valor}** em impostos municipais.
          """
        )

      {:error, %HTTPoison.Error{reason: reason}} ->
        Api.Message.create(channel_id, "Failed to fetch Breaking Bad quote: #{inspect(reason)}")
    end
  end
end
