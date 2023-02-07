class Api::V1::KafkaController < ApplicationController
  def produce
    kafka = KafkaProducer.new
    kafka.produce(Figaro.env.kafka_topic, request.body.read)
    
    response = {
      "status": "success",
      "message": "message successfully produced"
    }

    render json: response
  end
end
