class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience

        Waiter.all << self
    end 

    def self.all
        @@all
    end 

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end 

    # get list of all meals waiter (self) has served
    def meals
        Meal.all.select do |meals|
            meals.waiter == self
        end 
    end 

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end 

        best_tipped_meal.customer
    end 
end