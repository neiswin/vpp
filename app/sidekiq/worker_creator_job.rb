class WorkerCreatorJob
  include Sidekiq::Job
  PARAMS_MAPPING = [
    { "value_path_on_opc": "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1",
      "request_method": "read_float",
      "type_value": "Sinus"},
    { "value_path_on_opc": "OPCDACLIENT.opcdaclient.Random.PsFloat1",
      "request_method": "read_float",
      "type_value": "Random"}
 ]
 


  def perform(*args)
    puts 'Worker creator start!'
    PARAMS_MAPPING.each do |request_params|
        RequestSignalWorkerJob.perform_async(request_params)
      end

    WorkerCreatorJob.perform_async
  end
end
