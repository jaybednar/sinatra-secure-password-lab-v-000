class User < ActiveRecord::Base
  has_secure_password




  def self.make_deposit(user, amount)
    user.balance += amount
    user.save
  end

  def self.make_withdrawal(user, amount)
    if user.balance >= amount
      user.balance -= amount
      user.save
    else
      false
    end
  end

  def self.show_balance
    user = self.find(session[:user_id])
    user.balance
  end


end
