# require 'opcua_client'
# class RequestSignalWorker
#   include Sidekiq::Job

#   def perform(*args)
#     puts "start pool opc"
#     sleep(2)

#     client = OPCUAClient::Client.new
#     client.connect("opc.tcp://127.0.0.1:55000")
#     @sinus_value = client.method(args["request_method"].to_sym).call(2, args["key"])

#     @test_value = SignalValue.new
#     @test_value.type = args["type"]
#     @test_value.value = @sinus_value 

#     @test_value.save
#     client.disconnect

#     puts 'Poll end'

#     # RequestSignalWorker.perform_async
#   end
# end


# class WorkerCreator
#   PARAMS_MAPPING = [
#     { type: "sinusoid", key: "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1", request_method: 'read_float' },
#     { type: "random", key: "OPCDACLIENT.opcdaclient.Random.PsFloat1", request_method: 'read_float'  }
#   ]

#   MODELS_MAPPING = [
#     {"signal": Signal}
#   ]

#   # retry 0

#   # MODELS_MAPPING.fetch(type).create(attributes)

#   def self.call
#     PARAMS_MAPPING.each do |request_params|
#       RequestSignalWorkerJob.perform_async(request_params)
#     end
#   end
# end

