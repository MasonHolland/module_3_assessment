require 'rails_helper'

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at

RSpec.feature "User can look at an item index" do
  it "returns all items with no created at or updated at fields" do

    get '/api/v1/items'

    result = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(page).to have_content("ID:")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Description:")
    expect(page).to have_content("Image Url:")
    expect(page).to_not have_content("Created")
    expect(page).to_not have_content("Updated")
  end
end
