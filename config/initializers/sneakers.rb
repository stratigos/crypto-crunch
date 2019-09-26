require "sneakers"

Sneakers.configure(
  amqp: "amqp://guest:guest@localhost:5672",
  # connection: Bunny.new,
  exchange: "sneakers",
  exchange_type: :direct,
  heartbeat: 30,
  vhost: "/"
)

Sneakers.logger.level = Logger::INFO
