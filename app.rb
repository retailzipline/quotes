require 'sinatra'
require 'json'

QUOTES = [
  ["I just shed a tear! This is great!", "VP Stores @ Old Navy"],
  ["Teamwork makes the dream work!", "John C. Maxwell"],
  ["Software-as-a-Service is about Service (not Product)", "Chuck DeVita"],
  ["Products are evaluated, services are experienced", "Ken Rutsky"],
  ["We're taking retail by STORM!", "Melissa Wong"],
  ["When a company identifies how to integrate the processes needed to give the consumer a sense of job completion, it can blow away the competition. A product is easy to copy, but experiences are very hard to replicate.", "Clayton M. Christensen"],
  ["The product is not what you build. The product is the impact you have on the people who use what you build.", "Tom Chi"],
  ["People are always going to go shopping. A lot of our effort is just: 'How do we make the retail experience a great one?'", "Philip Green"],
  ["You walk into a retail store, whatever it is, and if there's a sense of entertainment and excitement and electricity, you wanna be there.", "Howard Schultz"],
  ["Think about something that needs to happen and find someone to do it", "Seth Godin"],
  ["Tell 10 people that you trust. If they don't tell anyone else, reconsider what you're doing.", "Seth Godin"],
  ["Focus on your strengths, don't try and fix weaknesses", "Marcus Buckingham"],
  ["It's kind of fun to do the impossible", "Walt Disney"]
].freeze

get '/' do
  <<~HTML
    <html>
    <body>
      #{QUOTES.sample.join(' &mdash; ')}
    </body>
    </html>
  HTML
end

get '/quotes.js' do
  content_type 'application/javascript'

  <<~JS
    quotesLoader(#{JSON.generate(QUOTES)});
  JS
end
