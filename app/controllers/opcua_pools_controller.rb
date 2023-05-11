class OpcuaPoolsController < ApplicationController
  require 'opcua_client'
  def index

    @opc_values = OpcuaPool.all
    @array_value = OpcuaPool.pluck(:name, :value)

    debugger



    begin
      client = OPCUAClient::Client.new
      client.connect("opc.tcp://127.0.0.1:55000") 
      debugger
      @value = OpcuaPool.new
  
      @value.value = client.read_float(2, "OPCDACLIENT.opcdaclient.Random.PsFloat1")
  
      @value.save

    rescue
      puts 'error'
    ensure
      client.disconnect
    end



  end
end
