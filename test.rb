class Fridge(brand,color,temp,plugged,contents)
  def initialize
    @brand =brand
    @color =color
    @temp =temp
    @plugged =plugged
    @contents =contents
  end

  def temperature_n_cel
  (@temperature - 32) * 5/9
  end
  def add_item(food)
  @contents << food
  end
end

fridge_1=Fridge.new("Maytag","black",36,true,["pizza","Gummy Bears"])
fridge_2=Fridge.new("generic", "black", 40, true, [])
fridge_3=Fridge.new("sears", "black", 33, false, ["celery"])




class Person(name,birth_year,language,alive,greet)
  def initialize
    attr_reader  :name,
                 :birth_year,
                 :language,
                 :alive,
                 :greet
    end
    @name =name
    @birth_year = birth_year
    @language =language
    @alive=alive
  end
end


person_1=Person.new("Bob",1993,"english",true)
person_2




require 'pry'
binding.pry
puts" "
