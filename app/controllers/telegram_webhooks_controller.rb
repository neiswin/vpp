# class TelegramWebhooksController < Telegram::Bot::UpdatesController
#   def start!(*)
#     respond_with :message, text: 'Привет! Я бот для работы с энергетическими значениями.'
#   end

#   def energy_values!(*)
#     energy_values = SignalValue.last(10).map { |ev| "#{ev.type_value} #{ev.value}" }
#     if energy_values.empty?
#       respond_with :message, text: 'Нет доступных значений'
#     else
#       respond_with :message, text: energy_values.join("\n")
#     end
#   end
# end
