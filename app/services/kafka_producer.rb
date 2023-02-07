require 'kafka'

class KafkaProducer
  def initialize
    @kafka = Kafka.new([Figaro.env.kafka_host])
  end

  def produce(topic, message)
    @kafka.deliver_message(message, topic: topic)
  end
end
