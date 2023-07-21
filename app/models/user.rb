class User < ApplicationRecord
    after_create :display_user_created
    validates :name, uniqueness: true
    validate :check_user_limit, on: :create 

  private

  def display_user_created
    puts "User Created"
  end

  def check_user_limit
    max_users = 7
    
    if User.count > max_users
      errors.add(:base, "User Limit Reached")
    end
  end
end
