class ContrivedMessenger
  def initialize(message:, route:, connection_client: Bunny.new)
    @connection = connection_client
    @message = message
    @routing_key = route
  end

  def run
    connection.start
    channel = connection.create_channel
    queue = channel.queue(routing_key, durable: true)

    channel.default_exchange.publish(message, routing_key: queue.name)

    puts("    💌 Publisher has published: #{message}:#{routing_key}")

    connection.close
  end

  private

  attr_accessor :connection, :message, :routing_key
end
