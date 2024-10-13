require 'net/http/persistent'
require 'json'

def start(jokes_number, workers = 10)
  uri = 'https://api.chucknorris.io/jokes/random'
  http = Net::HTTP::Persistent.new name: 'jokes'
  workers.times do
    Thread.new(jokes_number) do |jnumber|
      return if jnumber.zero?
      # perform a GET
      response = http.request uri
      jsn = JSON.parse(response.body)
      Joke.create! value: jsn['value']
      jnumber -= 1
      puts "jokes left: #{jnumber}"
    end.join
  end
end


start(100)