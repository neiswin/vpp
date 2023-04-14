require 'opcua_client'
require 'pg'






class PollopcJob
  include Sidekiq::Job

  class OpcuaPooling
    def initialize
      @opcua_client = OPCUAClient::Client.new
      @opcua_client.connect("opc.tcp://127.0.0.1:55000") 
      @db = PG.connect(dbname: 'vpp_development', user: 'vpp', password: '112131')
    end

    def read_and_write_to_database
      values_to_write = {}
      @opcua_client.with_session do |session|
        # Читаем необходимые значения с OPC UA сервера
        values_to_write[:value1] = session.read('ns=2;s=OPCDACLIENT.opcdaclient.Random.PsFloat1').value
        values_to_write[:value2] = session.read('ns=2;s=OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1').value
        # values_to_write[:value3] = session.read('ns=2;s=value3').value
      end
      
      # Записываем значения в базу данных PostgreSQL
      @db.exec_params("INSERT INTO opcua_pools(value1, value2) VALUES ($1, $2)", [values_to_write[:value1], values_to_write[:value2]])
    end
  end

  def perform(*args)
    puts 'OPC Pool Start'
    sleep(2)
    # client = OPCUAClient::Client.new

  




    opcuatopostgresql = OpcuaPooling.new
    opcuatopostgresql.read_and_write_to_database
    puts 'OPC Pool end'
  end
end

# Создаем экземпляр класса и запускаем метод для чтения значений с OPC UA сервера и записи их в базу данных PostgreSQ
      # client.connect("opc.tcp://127.0.0.1:55000") 
      # @opc_value = OpcuaPool.new

      # @opc_value.value = client.read_float(2, "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1")
      # @opc_value.name = "Sinusoid"
      # @opc_value.save

      # @opc_value.value = client.read_float(2, "OPCDACLIENT.opcdaclient.Static.PsFloat1")
      # @opc_value.name = "Static"
      # @opc_value.save

      # @opc_value.value = client.read_float(2, "OPCDACLIENT.opcdaclient.Random.PsFloat1")
      # @opc_value.name = "Random"
      # @opc_value.save

      # @opc_value.value = client.read_boolean(2, "OPCDACLIENT.opcdaclient.Random.PsBool1")
      # @opc_value.name = "Bool"
      # @opc_value.save

      # @opc_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Static.PsFloat1")
      # @opc_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Random.PsFloat1")
      # @opc_value = client.read_boolean(2, "OPCDACLIENT.opcdaclient.Random.PsBool1")
      # client.disconnect

    # begin
    #   client.connect("opc.tcp://127.0.0.1:55000") 
    #   @sinus_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1")
    #   @static_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Static.PsFloat1")
    #   @random_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Random.PsFloat1")
    #   @bool_value = client.read_boolean(2, "OPCDACLIENT.opcdaclient.Random.PsBool1")
    # ensure
    #   client.disconnect
    # end
    # PollopcJob.perform_async
