class Room

    attr_accessor :capacity, :occupants

    def initialize(num)
        @capacity = num
        @occupants = []
    end

    def full?         
          @occupants.length == @capacity
    end 

    def available_space
        @capacity - @occupants.length 
    end

    def add_occupant(name)
        return false if full?
        
        @occupants << name

        return true
        

    end

end
