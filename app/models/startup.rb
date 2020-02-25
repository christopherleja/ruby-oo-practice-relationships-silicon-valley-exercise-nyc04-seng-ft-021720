class Startup

    attr_accessor :name, :domain
    attr_reader :founder
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map {|startup| startup.domain} 
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|rounds| rounds.startup == self}
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        funding_rounds.reduce(0) {|sum, rounds| rounds.investment += sum}
    end

    def investors
        funding_rounds.map {|rounds| rounds.venture_capitalist.name}.uniq
    end

    def big_investors
        tres_commas = VentureCapitalist.tres_commas_club
        funding_rounds.select {|rounds| rounds.venture_capitalist && tres_commas.include?(rounds.venture_capitalist)}
    end

end
