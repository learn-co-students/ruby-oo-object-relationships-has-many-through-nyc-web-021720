class Meal

    attr_reader :waiter, :customer, :total, :tip

    @@all

    def initialize(
        meal_waiter, 
        meal_customer, 
        meal_total, 
        meal_tip
    )
        @waiter = meal_waiter
        @customer = meal_customer
        @total = meal_total
        @tip = meal_tip
        Meal.all << self
    end

    def self.all
        @@all
    end
end