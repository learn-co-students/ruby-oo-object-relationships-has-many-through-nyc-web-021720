class Customer

    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age

        Customer.all << self
    end 

    def self.all
        @@all
    end 

    # create new meal, pass customer (self) thru to meal
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end 

    # get list of all meals customer (self) has made
    def meals
        Meal.all.select do |meals|
            meals.customer == self
        end 
    end 

    # get list of waiter from each meal for customer
    def waiters
        meals.map do |meal|
            meal.waiter
        end 
    end 


end