class UqLibraries::LibraryDetails
    attr_accessor :level, :available, :out_of_available
    @@all = []

    def initialize(details_hash)
        @level = details_hash[:level]
        @available = details_hash[:available]
        @out_of_available = details_hash[:out_of_available]

        @@all << self
    end

    def self.create_from_collection(details_array)
        details_array.each {|details_hash| self.new(details_hash)}
    end

    def self.all
        @@all
    end
end