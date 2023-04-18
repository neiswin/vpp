class RequestSignalWorkerJob
  include Sidekiq::Job

  
  def perform(*args)
    puts "start pool opc"
    # sleep(2)
    
    client = OPCUAClient::Client.new
    client.connect("opc.tcp://127.0.0.1:55000")
    @sinus_value = client.method(args[0]["request_method"].to_sym).call(2, args[0]["value_path_on_opc"])
    
    @test_value = SignalValue.new
    @test_value.type_value = args[0]["type_value"]
    @test_value.value = @sinus_value 

    @test_value.save
    client.disconnect



    puts 'Poll end'
  end
end
