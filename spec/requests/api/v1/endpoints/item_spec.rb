require "rails_helper"

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

RSpec.describe "User can view an item endpoints" do
  context "when viewing the items index" do
    it "displays id, name, description and image url for each item" do

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

  # When I send a GET request to `/api/v1/items`
  # I receive a 200 JSON response containing all items
  # And each item has an id, name, description, and image_url but not the created_at or updated_at

  context "when viewing a single items page" do
    it "displays id, name, description and image url for the item" do

      get '/api/v1/items/1'

      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
    end
  end

  # When I send a DELETE request to `/api/v1/items/1`
  # I receive a 204 JSON response if the record is successfully deleted

  context "when deleting an entry" do
    it "is not displayed on the index page" do

      item = Item.last

      delete "api/v1/items/#{item.id}"

      expect(response).to have_http_status(204)

      get 'api/v1/items'

      expect(page).to_not have_content(item.id)
      expect(page).to_not have_content(item.name)
      expect(page).to_not have_content(item.description)
    end
  end

  # When I send a POST request to `/api/v1/items` with a name, description, and image_url
  # I receive a 201 JSON  response if the record is successfully created
  # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

  context "when creating an item" do
    it "returns json containing relevant info" do

    end
  end
end
