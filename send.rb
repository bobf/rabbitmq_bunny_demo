require 'bunny'

def send
  connection = Bunny.new
  connection.start

  channel = connection.create_channel
  queue = channel.queue('cats')
  queue.publish ARGV[0]

  puts "Sent message: #{ARGV[0]}"
  connection.stop
end

send
