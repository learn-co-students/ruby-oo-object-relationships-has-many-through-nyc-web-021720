class Customer

    attr_reader :name, :age 
    @@all = []
    def initialize (name, age)  
        @name = name
        @age = age
        Customer.all << self 
    end

    def self.all
        @@all
    end

    def new_meal(waiter,total, tip=0)
        Meal.new(waiter,self,total, tip)
    end

    def meals
        Meal.all.select do |meal_obj|
            meal_obj.customer == self 
        end
    end #returns meals assocatied with customer

    def waiters
        meals.map do |meal_obj|
             meal_obj.waiter
         end
    end #returns array of waiters assocaited with meal for customer as previosly defined
end
