module SessionHelpers

  def add_review(restaurant_name, author, content, rating)
    visit '/restaurants'
    click_link restaurant_name
    click_link 'Add a review'
    fill_in 'Author Name', with: author
    fill_in 'Review', with: content
    select(rating, :from => 'Rating')
    click_button 'Create Review'
  end

  def add_restaurant(name, description)
    visit '/restaurants/new'
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    click_button 'Create Restaurant'
  end

end
