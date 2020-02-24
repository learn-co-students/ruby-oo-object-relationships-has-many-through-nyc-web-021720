class Waiter

    attr_reader :name, :experience

    @@all

    def initialize(waiter_name, waiter_experience)
        @name = waiter_name
        @experience = waiter_experience
        Waiter.all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        meals.max_by do |meal|
            meal.tip
        end.customer
    end

    def self.all
        @@all
    end
end