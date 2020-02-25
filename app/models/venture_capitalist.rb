class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth >= 1_000_000_000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
      FundingRound.all.map do |round| 
            if round.venture_capitalist == self
                round.startup
            end
        end
    end

    def biggest_investment
        funding_rounds.max {|round| round.investment}
    end

    def invested(domain)
        startup_domain = FundingRound.all.select {|round| round.startup.domain == domain}
        startup_domain.map {|round| round.investment}.sum
    end
end
