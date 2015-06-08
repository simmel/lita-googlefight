require "lita"

module Lita
  module Handlers
    class Googlefight < Handler

      route(/^!g(?:oogle)?f(?:ight)?\s+(.+)/, :googlefight, help: { "!g(oogle)f(ight) term one(:|;)term two" => "GoogleFight terms against each other" })

      def googlefight(response)
        answers = response.match_data.captures.join.split(/ ?; ?/, 2)
        require 'pp'
        pp answers
        response.reply("meow")
      end

    end

    Lita.register_handler(Googlefight)
  end
end
