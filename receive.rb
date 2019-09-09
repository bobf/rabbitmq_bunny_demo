require 'bunny'

def receive
  connection = Bunny.new
  connection.start

  channel = connection.create_channel
  queue = channel.queue('cats')

  queue.subscribe(block: true) do |info, params, message|
    puts params
    puts info
    puts "Received message: #{message}"
  end
end

receive
