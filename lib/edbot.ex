defmodule Edbot do
  use Nostrum.Consumer

  alias Edbot.Commands

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect(msg)

    case msg.content do
      "!fake" -> Commands.fetch_pic(msg.channel_id)
      "!procurado" -> Commands.fetch_crime(msg.channel_id)
      "!brba" -> Commands.fetch_quote(msg.channel_id)
      "!imposto" -> Commands.fetch_imposto(msg.channel_id)
      "!espaço" -> Commands.fetch_people_in_space(msg.channel_id)
      "!ip" -> Commands.fetch_ip(msg.channel_id)
      "!cep" <> _rest = content -> Commands.fetch_cep(msg.channel_id, content)
      "!help" -> Commands.show_help(msg.channel_id)
      _ -> :ignore
    end
  end
end
