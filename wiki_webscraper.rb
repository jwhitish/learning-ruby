#scrapes the page of wiki_url and saves to wiki_local_filename

require 'rubygems'
require 'rest-client'

wiki_url = "http://en.wikipedia.org/"
wiki_local_filename = "wiki-page.html"

File.open(wiki_local_filename, "w") do |file|
  file.write(RestClient.get(wiki_url))
end

#reads and puts the contents of wiki_local_filename in the terminal

#contents = File.open(wiki_local_filename, "r")
#puts contents.read
