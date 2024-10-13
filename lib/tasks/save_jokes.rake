require 'net/http/persistent'
require 'json'
require 'benchmark'

class FooError < StandardError;end

def start(jokes_number, workers = 4)
  jnumber = jokes_number
  batch_size = (jokes_number.to_f/workers).ceil
  uri = 'https://api.chucknorris.io/jokes/random'
  http = Net::HTTP::Persistent.new name: 'jokes'
  threads = (0...workers).to_a.map do |num|
    Thread.new(http, uri, batch_size) do |http_obj, uri_obj, batch_size_obj|
      begin
        # Thread.control_interrupt(RuntimeError => :immediate) do |e|
        #   puts "INTERRUPT #{e.inspect} #{Thread.current.object_id}"
        # end
        batch_size_obj.times do
          response = http_obj.request uri_obj
          jsn = JSON.parse(response.body)
          Joke.create! value: jsn['value']
        end
      rescue FooError => e
        puts "RESCUE FooError #{e.inspect}"
        # puts "SUPERERROR #{Thread.current.object_id}"
      rescue Exception => e
        puts "RESCUE Exception #{e.inspect}"
      ensure
        puts "ENSURE AFTER #{Thread.current.object_id}"
      end
    end
  end
  thr = threads.first
  threads << Thread.new(thr) do
    sleep 1
    puts "kill #{thr.object_id}"
    thr.raise FooError.new('awdawd')
    puts 'end here'
  end
  threads.each { |aThread|  aThread.join }
  http.shutdown
end

def register_request(client, name)
  request_uri = "http://localhost:3000/pages/echo"
  post = Net::HTTP::Post.new(request_uri)
  post.body = name

  print "#{name} starts request, thread: #{Thread.current.object_id}\n"
  res = client.request request_uri, post
  print "#{name} receives: #{res.body} (thread: #{Thread.current.object_id})\n"
ensure
  print "#{name}'s request is done, thread: #{Thread.current.object_id}\n"
end

namespace :save_jokes do
  desc 'Saves jokes to database'
  task start: :environment do
    puts Benchmark.measure { start(100) }
  end

  desc 'Demo echo server with error'
  task echo: :environment do
    # can be any pool size, but using 1 to easily reproduce the issue with connection re-use
    http_persistent = Net::HTTP::Persistent.new(name: "testing", pool_size: 1)

    # start a request that will take some time
    t1 = Thread.start do
      Thread.handle_interrupt(Exception => :on_blocking) do
        request_uri = "http://localhost:3000/pages/echo"
        post = Net::HTTP::Post.new(request_uri)
        name = 'Alice'
        post.body = name
        res = nil
        connection = http_persistent.connection_for(URI(request_uri))
        Thread.handle_interrupt(Exception => :immediately) do
          print "#{name} starts request, thread: #{Thread.current.object_id}\n"
          res = http_persistent.request request_uri, post
          print "#{name} receives: #{res.body} (thread: #{Thread.current.object_id})\n"
        end
      ensure
        Thread.handle_interrupt(Exception => :never) do
          connection.finish if connection
        end
      end
    end

    sleep 2 # wait for the request to start
    # interrupt the thread, it can be anything, e.g. a timeout (the only difference is a signal)
    t1.kill.join

    # register_request(http_persistent, "Bob")
    sleep 200
  end

end
