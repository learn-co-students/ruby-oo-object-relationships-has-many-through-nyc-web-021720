class Customer

    attr_reader :name, :age

    @@all

    def initialize(customer_name, customer_age)
        @name = customer_name
        @age = customer_age
        Customer.all << self
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.customer == self }
    end

    def waiters
        meals.map {|meal| meal.waiter}
    end

    def self.all
        @@all
    end
end