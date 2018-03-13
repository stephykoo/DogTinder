class Dog < ApplicationRecord
  #Here is the new line of code
  validates :name, presence: true
  validates :age, presence: true
  validates :enjoys, presence: true
  validates :enjoys, length: { minimum: 10, too_short: "10 characters is the minimum" }
end
