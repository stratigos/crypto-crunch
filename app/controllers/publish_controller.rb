class PublishController < ApplicationController
  skip_before_action :verify_authenticity_token

  def publish
    bunny = Bunny.new(ENV["CLOUDAMQP_URL"])

    publisher_service = PublishMessage.new(
      message: message_from_body,
      route: queue_routing_key,
      connection_client: bunny
    )
    publisher_service.run

    head :no_content
  end

  private

  def message_from_body
    @message_from_body ||= request.body.read
  end

  def queue_routing_key
    "contrived_route_one".freeze
  end
end
