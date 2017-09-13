class AddAdminUsers < ActiveRecord::Migration
  def change
    users = [
      {
        email: 'alexchien97@gmail.com',
        password: 'pa55w0rd',
        name: 'Alex Chien',
        display_name: 'boombastic'
      },
      {
        email: 'hackfisher@gmail.com',
        password: 'pa55w0rd',
        name: 'Denny Wang',
        display_name: 'hackfisher'
      },
      {
        email: 'logxing521@hotmail.com',
        password: 'pa55w0rd',
        name: 'Logxing',
        display_name: 'logxing'
      }
    ]

    users.each do |u|
      User.create({
        email: u[:email],
        password: u[:password],
        password_confirmation: u[:password],
        name: u[:name],
        display_name: u[:display_name]
      })
    end
  end
end
