class SignalValuesController < ApplicationController
  require 'opcua_client'
  def index
    @opcvalues = SignalValue.last(5)
  end
end
