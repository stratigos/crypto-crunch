require "sneakers"

Sneakers.configure(
  amqp: ENV["CLOUDAMQP_URL"],
  # connection: Bunny.new,
  exchange: "sneakers",
  exchange_type: :direct,
  heartbeat: 30
)

Sneakers.logger.level = Logger::INFO
