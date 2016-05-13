class Cars
    attr_reader :horn
                :distance
    def initialize(horn,distance)
    @horn=horn
    @distance=distance
    end
  def drive(distance)
    puts "I am driving #{distance} MPH"
  end
end


my_car=Cars.new("beeeep",54)


puts my_car.horn
puts my_car.distance
