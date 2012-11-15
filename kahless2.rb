#homepage in camping August 31, 2012


Camping.goes :Homepage

module Homepage::Controllers
  class Index < R 'polar-refuge-2424.herokuapp.com'

    def get
      render :index
    end #end of the get method.
    
  end #end of he index class
  class Page < R '/(\w+)'

    def get page_name
      render page_name
    end #end of the get(page_name) method
    
  end #end fo the Page class


class Character
  #setting the getter and setter methods and variables.
  attr_accessor :stats_array, :class, :race, :level, :hp, :ac, :basic_attack, :str, :dex, :con, :int, :wis, :cha

  def initialize
   dice = Proc.new do #here's the dice proc. Not sure how to make this more efficient.
     |total|
       total = 0
         total += rand(6) + 1
         total += rand(6) + 1
         total += rand(6) + 1	 
   end #end of the dice proc.
   #creating the stats and mods array.
  @stats_array = Array.new(6){Array.new << dice.call} #we calculate all the stats and put them in an array using the above block.
  @stats_array.each {|item| item << (item[0] - 10)/2}  #here we figure the modifier 
  #not sure if defining all the stats is worthwile.

 #here we use the next method to choose race and class.
 self.race_class_select
  end #end of initialize method.
  
  def race_class_select
    #here we put all the main stats into an array. 
    temp_stats_array = []
    @stats_array.each {|item| temp_stats_array <<  item[0]}
    #then we compare the hightest scores. We choose class based on scores.
     if temp_stats_array.max == @stats_array[0][0]
       @class = :fighter
     elsif
       temp_stats_array.max == @stats_array[1][0]
       @class = :thief
     elsif
       temp_stats_array.max == @stats_array[2][0]
         @class = [:fighter, :cleric].sample
     elsif
       temp_stats_array.max == @stats_array[3][0]
         @class = :magic_user
     elsif
       temp_stats_array.max == @stats_array[4][0]
         @class = :cleric
     elsif
       temp_stats_array.max == @stats_array[5][0]
         @class = [:thief, :magic_user].sample
     end
    #here we just choose race at random.
    @race = [:Dwarf, :Human, :Elf, :Halfling].sample
  end #end of race_class_select

end #end of the character class.



end #end of he controllers module.



module Homepage::Views
  def layout
    html do
      title { "Character Sheet" }
      body { self << yield}
    end #end of the html block
  end #end of the layout method.

  def index
  conan = Homepage::Controllers::Character.new
      center do 
      h1 "#{conan.race} #{conan.class}" 
      p "Str:#{conan.stats_array[0][0]}  Mod:#{conan.stats_array[0][1]}"
      p "Dex:#{conan.stats_array[1][0]}  Mod:#{conan.stats_array[1][1]}"
      p "Con:#{conan.stats_array[2][0]}  Mod:#{conan.stats_array[2][1]}"
      p "Int:#{conan.stats_array[3][0]}  Mod:#{conan.stats_array[3][1]}"
      p "Wis:#{conan.stats_array[4][0]}  Mod:#{conan.stats_array[4][1]}"
      p "Cha:#{conan.stats_array[5][0]}  Mod:#{conan.stats_array[5][1]} "

    end #end of the center block.
  
  end #end of the index method. 


end #end of the views  module
