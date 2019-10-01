#!/usr/bin/env ruby
require "bunny"

namespace :consume do
  desc "Consume a Message via Bunny - to test alongside Sneakers"
  task message: :environment do
    connection = Bunny.new
    connection.start

    channel = connection.create_channel
    queue = channel.queue("contrived_route_one", durable: true)

    begin
      puts " [👂] Waiting for messages. To exit press CTRL+C"
      queue.subscribe(block: true) do |delivery_info, _properties, message|
        puts " [📬] Received #{message}"
        contrived_work = message.tr("work", "👩‍🏭")
        puts " [✅] Finished processing message: #{contrived_work}"
        channel.ack(delivery_info.delivery_tag)
      end
    rescue Interrupt => _
      connection.close
      puts " [👋] You are no longer listening to me talk!"

      exit(0)
    end
  end
end
