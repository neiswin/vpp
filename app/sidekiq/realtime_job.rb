# class RealtimeJob
#   include Sidekiq::Job

#   def perform(*args)
#     @realtime_value = Realtime.new
#     @last_value_from_opc = SignalValue.last
#     @realtime_value.name = @last_value_from_opc.type_value
#     @realtime_value.value = @last_value_from_opc.value
    
#     @realtime_value.save
#     puts "RealtimeValue Create"


#     sleep(1)
#     RealtimeJob.perform_async

#   end
# end
