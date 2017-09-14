class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    !!is_admin
  end

  rails_admin do
    weight 100
    configure :email do
      read_only true
    end

    show do
      include_all_fields
    end

    edit do
      include_fields :email, :password, :password_confirmation, :name, :display_name
    end
  end
end
