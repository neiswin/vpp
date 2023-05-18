
# require File.expand_path('../config/environment', __dir__)

# require 'telegram/bot'
# # require_relative '../../app/models/signal_value'


# token = '5869726631:AAFfxDVWXmVOmb0SwV0sszXpwVdLVC0k5cA'

# Telegram::Bot::Client.run(token) do |bot|
#   bot.listen do |message|
#     case message.text
#     when '/start'
#       bot.api.send_message(chat_id: message.chat.id, text: 'Привет! Я бот для работы с энергетическими значениями.')
#     when '/energy_values'
#       # energy_values = SignalValue.last(10).map { |ev| "#{ev.type_value} #{ev.value}" }
#       # response = energy_values.empty? ? 'Нет доступных значений' : energy_values.join("\n")
#       response = "text from response"
#       bot.api.send_message(chat_id: message.chat.id, text: response)
#     end
#   end
# end
