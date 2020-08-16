require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name,hash)
        @name = name
        @rooms = Hash.new
        hash.each { |room_name,capacity| @rooms[room_name] = Room.new(capacity) }
    end

    def name
        @name.split(" ").map { |x| x.capitalize }.join(" ")
    end

    def room_exists?(name)
        return true if @rooms.include?(name)
        return false
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
          puts "sorry, room does not exist"
          return
        end

       #self.room_exists?(room_name) && self.add_occupant(room_name)

       success = @rooms[room_name].add_occupant(person)
    if success
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  

    end

    def has_vacancy?
        @rooms.values.any? { |room| !room.full? }
      end

    def list_rooms

        @rooms.each do |name,room|
            puts "#{name} : #{room.available_space}" 
        end

    end

  
end
