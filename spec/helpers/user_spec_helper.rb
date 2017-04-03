def sign_up_and_in
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  @user = User.find_by_email('test@example.com')
end

def sign_in_with_another_user
  click_link "Sign out"
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 't@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  user = User.find_by_email('t@example.com')
end

def leave_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end

# def sign_in
#   visit('/')
#   click_link('Sign in')
#   fill_in('Email', with: 'test@test.com')
#   fill_in('Password', with: 'test123')
#   click_button('Sign in')
# end
