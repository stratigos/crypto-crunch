
namespace :publish do
  desc "Publish a Message to an Exchange"
  task :message, [:msg, :route] => [:environment] do |_task, args|
    message = args[:msg] || "contrived message for worker"
    route = args[:route] || "contrived_route_one"
    bunny = Bunny.new

    puts "📯 Preparing to send a message: #{message}"

    cm = ContrivedMessenger.new(
      message: message,
      route: route,
      connection_client: bunny
    )
    cm.run

    puts "📭 Message sent \n\n"
  end
end
