class SignalValuesController < ApplicationController
  require 'opcua_client'
  def index

    
    @opcvalues = SignalValue.last(5)

    @sinus = SignalValue.where(type_value: "Sinus").last(10)

    @randoms = SignalValue.where(type_value: "Random").last(10)

    @turbo_value = SignalValue.last

    @goals = SignalValue.last(100)

    start_time = 1.hour.ago

    @powers = SignalValue.where(type_value: "Sinus").where("created_at >= ?", start_time)



    @data_chart= @powers.select(:created_at, :value).map { |data| [data.created_at, data.value] }.to_h


    @data_pie_chart = [["Blueberry",44],["Strawberry",23],["Banana",22]]
  
# debugger








    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace("latest-value", partial: "signal_values/value", locals: {value: @turbo_value})
    #   end
    # end

    # debugger
  end


  def latest_value

    @value_from_db = SignalValue.last

    @value = @value_from_db.value
    # debugger
    render turbo_stream: turbo_stream.replace("last-value", partial: "signal_values/value", locals: { value: @value })



    
  end
end
