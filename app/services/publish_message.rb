class PublishMessage
  def initialize(message:, route:, connection_client: Bunny.new)
    @connection = connection_client
    @message = message
    @routing_key = route
  end

  def run
    Rails.logger.info("📯 Preparing to send a message: #{message}")

    cm = ContrivedMessenger.new(
      message: message,
      route: routing_key,
      connection_client: connection
    )
    cm.run

    Rails.logger.info("📭 Message sent \n\n")
  end

  private

  attr_accessor :connection, :message, :routing_key
end
