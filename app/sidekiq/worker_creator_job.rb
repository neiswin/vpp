class WorkerCreatorJob
  include Sidekiq::Job
  
  PARAMS_MAPPING = [
    { "value_path_on_opc": "OPCDA.client.Sinusoid.PsInteger1",
      "request_method": "read_int32",
      "type_value": "Sinus"},
    { "value_path_on_opc": "OPCDA.client.Random.PsInteger1",
      "request_method": "read_int32",
      "type_value": "Random"}
 ]
 


  def perform(*args)
    puts 'Worker creator start!'
    PARAMS_MAPPING.each do |request_params|
        RequestSignalWorkerJob.perform_async(request_params)
      end
    sleep(5)
    WorkerCreatorJob.perform_async
  end
end
