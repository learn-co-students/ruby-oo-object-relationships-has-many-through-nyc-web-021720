class Waiter
    attr_reader :name,:years
    @@all = []
    def initialize(name,years)
        @name = name 
        @years = years 
        Waiter.all << self 
    end 

    def self.all 
        @@all 
    end 

    def new_meal(customer,total,tip)
        new_meal = Meal.new(self,customer,total,tip)
    end 

    def meals 
        Meal.all.select{|meal|meal.waiter == self}
    end 

    
    
    def best_tipper 
        
        meals.max_by{|meal|meal.tip}.customer 
        #meals.max_by do |meal|
            #meal.tip
        #end.customer  
        #return customer associated to meal with biggest tip 
        
    
    end 
end