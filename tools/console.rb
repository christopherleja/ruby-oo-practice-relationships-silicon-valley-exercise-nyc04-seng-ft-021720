require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

pp = Startup.new("Pied Piper", "Richard Hendricks", "Compression")
hooli = Startup.new("Hooli", "Gavin Belson", "Conquest")
aviato = Startup.new("Aviato", "Ehrlich Bachmann", "Algorithms")

big_head = VentureCapitalist.new("Nelson Bigetti", 950_000_000)
russ = VentureCapitalist.new("Russ Hanniman", 2_600_000_000)
lori = VentureCapitalist.new("Lori Brehm", 1_200_000_000)

a = FundingRound.new(pp, lori, "Angel", 10_000_000)
b = FundingRound.new(aviato, russ, "First Round", 60_000_000)
a = FundingRound.new(hooli, big_head, "Second Round", 75_000_000)
d = FundingRound.new(pp, russ, "Second Round", 100_000_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line