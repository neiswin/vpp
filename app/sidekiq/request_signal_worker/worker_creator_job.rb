class RequestSignalWorker::WorkerCreatorJob
  include Sidekiq::Job

  def perform(*args)
    # Do class WorkerCreator

    puts 'Worker creator'
    PARAMS_MAPPING = [
      { type: "sinusoid", key: "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1", request_method: 'read_float' },
      { type: "random", key: "OPCDACLIENT.opcdaclient.Random.PsFloat1", request_method: 'read_float'  }
    ]
  
    # MODELS_MAPPING = [
    #   {"signal": Signal}
    # ]
  
    # retry 0
  
    # MODELS_MAPPING.fetch(type).create(attributes)
  
    def self.call
      PARAMS_MAPPING.each do |request_params|
        RequestSignalWorker.perform_async(request_params)
      end
    end
  end



end
