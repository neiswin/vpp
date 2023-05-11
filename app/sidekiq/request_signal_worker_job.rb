class RequestSignalWorkerJob
  include Sidekiq::Job

  
  def perform(*args)
    puts "start pool opc"
    # sleep(2)
    
    client = OPCUAClient::Client.new
    client.connect("opc.tcp://127.0.0.1:55555")
    @value_from_opc = client.method(args[0]["request_method"].to_sym).call(2, args[0]["value_path_on_opc"])
    
    @test_value = SignalValue.new
    @test_value.type_value = args[0]["type_value"]
    @test_value.value = @value_from_opc 

    # находим текущую дату и время
    now = Time.now

    # ищем запись в таблице DateDictionary, которая соответствует текущей дате и времени
    date_dictionary = DateDictonary.find_by(
      year: now.year,
      month: now.month,
      week: now.strftime('%U').to_i,
      day: now.day,
      hour: now.hour
    )

    # получаем id найденной записи

    @test_value.date_dictonaries_id = date_dictionary.id
    @test_value.save

    # debugger
    client.disconnect



    puts 'Poll end'
  end
end
