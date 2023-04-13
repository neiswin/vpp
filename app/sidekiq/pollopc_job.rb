class PollopcJob
  include Sidekiq::Job

  def perform(*args)
    puts 'hello world'
    sleep(5)
    PollopcJob.perform_async
  end
end
