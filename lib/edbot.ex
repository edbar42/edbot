defmodule Edbot do
  use Nostrum.Consumer

  alias Nostrum.Api

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect(msg)

    case msg.content do
      "!ping" -> Api.Message.create(msg.channel_id, "Pong!")
      _ -> :ignore
    end
  end
end
