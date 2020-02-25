
class Customer
  attr_accessor :name, :age, :tip
    @@all = []

    def initialize(name, age)
        @age = age
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        self.meals.map {|meal| meal.waiter}
    end
end
