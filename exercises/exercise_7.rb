require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"


### Exercise 7: Validations for both models

#1. Add validations to two models to enforce the following business rules:

#- Employees must always have a first name present
#- Employees must always have a last name present
#- Employees have a hourly_rate that is a number (integer) between 40 and 200
#- Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
#- Stores must always have a name that is a minimum of 3 characters
#- Stores have an annual_revenue that is a number (integer) that must be 0 or more
#- BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a [custom validation method](http://guides.rubyonrails.org/active_record_validations.html#custom-methods) - **don't** use a `Validator` class)

#2. Ask the user for a store name (store it in a variable)
#3. Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
#4. Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record

# Your code goes here ...

class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 40,
    less_than_or_equal_to: 200
  }
  validates :store, presence: true
end

class Store < ActiveRecord::Base
  validates :name, presence:true, length: { minimum: 3 }
  validates :annual_revenue, presence:true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  validate :carries_apparel

  def carries_apparel
    unless mens_apparel || womens_apparel
      errors.add(:base, "must carry at least one of the men's or women's apparel")
    end
  end
end

print "Enter a store name: "
user_input_store_name = gets.chomp

new_store = Store.create(name: user_input_store_name)
puts new_store.errors.full_messages