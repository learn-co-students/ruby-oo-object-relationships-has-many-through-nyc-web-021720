class Waiter
    attr_accessor :name, :experiance
   @@all = []

    def initialize(name, experiance)
        @name = name
        @experiance = experiance
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def customers
        self.meals.map {|meal| meal.customer}
    end

    def best_tipper
        self.meals.sort{|x,y| x.tip <=> y.tip}[-1].customer
    end

end