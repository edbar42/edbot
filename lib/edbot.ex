defmodule Edbot do
  use Nostrum.Consumer

  alias Edbot.Commands

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect(msg)

    case msg.content do
      "!fake" -> Commands.fetchPic(msg.channel_id)
      "!procurado" -> Commands.fetchCrime(msg.channel_id)
      "!brba" -> Commands.fetchQuote(msg.channel_id)
      "!imposto" -> Commands.fetchImposto(msg.channel_id)
      _ -> :ignore
    end
  end
end
