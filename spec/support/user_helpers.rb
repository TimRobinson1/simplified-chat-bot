def sign_up
  visit '/sign_up'
  fill_in 'user[name]', with: 'TestUser'
  fill_in 'user[email]', with: 'user@email.com'
  fill_in 'user[password]', with: 'password'
  find('.submit-field input').click
end
