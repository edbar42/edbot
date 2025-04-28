defmodule Edbot do
  use Nostrum.Consumer

  alias Edbot.Commands

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect(msg)

    case msg.content do
      "!ping" -> Commands.pong(msg.channel_id)
      "!fakepic" -> Commands.fetchPic(msg.channel_id)
      "!procurado" -> Commands.fetchCrime(msg.channel_id)
      _ -> :ignore
    end
  end
end
