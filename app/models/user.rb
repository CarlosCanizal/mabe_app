class User < ActiveRecord::Base
  attr_accessible :email, :lastname, :name, :phone_id, :phone1, :phone2, :phone3, :total

  class << self
    def phones()
      phones = {
        1 => 'Galaxy c/Plan  $'+prices[1].to_s+' MXN',
        2 => 'Galaxy s/Plan  $'+prices[2].to_s+' MXN',
        3 => 'iPhone c/Plan  $'+prices[3].to_s+' MXN'
      }
    end
  end

  class << self
    def prices()
      prices = {
        1 =>10,
        2 =>20,
        3 =>30
      }
    end
  end

  validates :name, :lastname, :presence=>true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_id , :numericality => { :greater_than => 0, :less_than_or_equal_to => 3 }
  validates :phone1 , :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
  validates :phone2 , :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
  validates :phone3 , :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }

end
