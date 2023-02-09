require 'kafka'

class KafkaProducer
  CLIENT_KEY = Figaro.env.kafka_client_key.to_s
  CLIENT_CERT = Figaro.env.kafka_client_cert.to_s
  CLIENT_CA = Figaro.env.kafka_ca_cert.to_s

  def initialize
    kafka_host = Figaro.env.kafka_host
    kafka_topic = Figaro.env.kafka_topic

    client_key = File.read(CLIENT_KEY)
    client_cert = File.read(CLIENT_CERT)
    ca_cert = IO.read(CLIENT_CA)

    @kafka = Kafka.new([kafka_host], ssl_client_cert: client_cert, ssl_client_cert_key: client_key, ssl_ca_cert: ca_cert)
  end

  def produce(topic, message)
    @kafka.deliver_message(message, topic: topic)
  end
end
