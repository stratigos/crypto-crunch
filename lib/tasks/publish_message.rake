
namespace :publish do
  desc "Publish a Message to an Exchange"
  task message: :environment do 
    puts "📯 Preparing to send a message"

    cm = ContrivedMessenger.new
    cm.run

    puts "📭 Message sent \n\n"
  end
end
