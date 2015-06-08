require "lita"
require 'json'
require 'open-uri'
require 'cgi'

Word = Struct.new(:word, :hits)

module Lita
  module Handlers
    class Googlefight < Handler

      route(/^!g(?:oogle)?f(?:ight)?\s+(.+)/, :googlefight, help: { "!g(oogle)f(ight) term one(:|;)term two" => "GoogleFight terms against each other" })

      def googlefight(response)
        one, two = response.match_data.captures.join.split(/ *[:;] */, 2).map {
          |i| Word.new(i)
        }
        result = nil

        [one, two].each do |word|
          url = 'http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=' + CGI.escape(word.word)
          begin
            open(url, "Referer" => "http://soy.se", "User-Agent" => "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19") do |f|
              word.hits = JSON.parse(f.read)['responseData']['cursor']['estimatedResultCount'].to_i
            end
          rescue OpenURI::HTTPError => e
            result = e.io.status.first.to_i
          end

          if word.hits.nil?
            result = "Google returned HTTP Status #{result} ='/"
            debug.log result + " on " + url
            break
          end
        end

        if result.nil?
          winner = [one, two].sort_by { |w| w.hits }.reverse.first
          result = one.word + " (" + one.hits.to_s + ") vs. " + two.word + " (" + two.hits.to_s + "): WINNER: " + winner.word + "!"
          response.reply result
        else
          log.error result, winner, one, two
          response.reply "ohnoes, I fail = /"
        end

      end

    end

    Lita.register_handler(Googlefight)
  end
end
