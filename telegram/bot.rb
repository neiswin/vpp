require File.expand_path('../config/environment', __dir__)


require 'telegram/bot'

token = '5869726631:AAFfxDVWXmVOmb0SwV0sszXpwVdLVC0k5cA'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    energy_values = SignalValue.last(10).map { |ev| "#{ev.type_value} #{ev.value}" }
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello World! #{message.from.first_name}" )

    when '/report'
      # energy_values = SignalValue.last
      response = energy_values.join("\n")
      # response = "#{value}"
      bot.api.send_message(chat_id: message.chat.id, text: response)
    end



  end


end