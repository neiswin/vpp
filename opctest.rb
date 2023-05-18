require 'opcua_client'

client = OPCUAClient::Client.new
begin
  puts "start connect"
  client.connect("opc.tcp://127.0.0.1:55555")
  # write to ns=2;s=1
  puts "connect done"

  puts client.read_float(1, "OPCDA.client.Sinusoid.PsFloat1")

ensure
  client.disconnect
end