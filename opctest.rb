require 'opcua_client'

client = OPCUAClient::Client.new
begin
  puts "start connect"
  client.connect("opc.tcp://192.168.0.22:4840")
  # write to ns=2;s=1
  puts "connect done"

  puts client.write_boolean(4 , "|var|PLC210 (Arm32bit + Linux ).Application.PLC_PRG.xB", true)

ensure
  client.disconnect
end