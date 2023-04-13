class OpcuaPoolsController < ApplicationController
  def index
    @opc_values = OpcuaPool.all
    @array_value = OpcuaPool.pluck(:name, :value)
  end
end
