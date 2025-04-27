defmodule Edbot do
  use Nostrum.Consumer

  alias Edbot.Commands

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect(msg)

    case msg.content do
      "!ping" -> Commands.pong(msg)
      "!fakepic" -> Commands.fetchPic(msg)
      _ -> :ignore
    end
  end
end
