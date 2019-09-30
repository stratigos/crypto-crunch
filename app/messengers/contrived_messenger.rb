class ContrivedMessenger
  def initialize(
    message: "contrived message!",
    route: "contrived_route_one",
    connection_client: Bunny.new
  )
    @connection = connection_client
    @message = message
    @routing_key = route
  end

  def run
    connection.start
    channel = connection.create_channel
    exchange = channel.direct("direct_messages")

    exchange.publish(message, routing_key)

    puts("Broadcasting that publisher did a thing: #{message}:#{routing_key}")

    connection.close
  end

  private

  attr_accessor :connection, :message, :routing_key
end
