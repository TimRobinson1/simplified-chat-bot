def sign_up
  visit "/"
  fill_in 'user[name]', with: 'User'
  fill_in 'user[email]', with: 'user@email.com'
  fill_in 'user[password]', with: 'password'
  find('.submit-field input').click
end
