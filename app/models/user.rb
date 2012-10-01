class User < ActiveRecord::Base
  attr_accessible :email, :lastname, :name, :phone_id, :phone1, :phone2, :phone3, :total, :unique

  class << self
    def phones()
      phones = {
        1 => 'Samsung Galaxy Ace (150 Minutos / Sin Datos) $'+prices[1].to_s+' MXN mensuales',
        2 => 'Samsung Galaxy Ace (150 Minutos / 600 MB) $'+prices[2].to_s+' MXN mensuales',
        3 => 'iPhone 4S  (300 Minutos / 800 MB) $'+prices[3].to_s+' MXN mensuales'
      }
    end
  end

  class << self
    def familiarPhones()
      familiarPhones = {
        1 => 'Samsung Galaxy Ace (150 Minutos / Sin Datos)',
        2 => 'Samsung Galaxy Ace (150 Minutos / 600 MB)',
        3 => 'iPhone 4S  (300 Minutos / 800 MB)'
      }
    end
  end

  class << self
    def prices()
      prices = {
        1 =>0.00,
        2 =>192.57,
        3 =>267.75
      }
    end
  end

  class << self
    def familiares()
      familiares = {
        1 =>216.00,
        2 =>408.67,
        3 =>520.00
      }
    end
  end

  class << self
    def downpayment()
      downpayment = {
        1 =>404.00,
        2 =>404.00,
        3 =>2199.00
      }
    end
  end

  validates :name, :lastname, :presence => true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: {message:"ya se encuentra registrado"}, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_id , :numericality => { :greater_than => 0, :less_than_or_equal_to => 3 }
  validates :phone1 , :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
  validates :phone2 , :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
  validates :phone3 , :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }

end
