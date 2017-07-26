require "rails_helper"

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

RSpec.describe "User can view an item endpoints" do
  context "when viewing the items index" do
    it "displays id, name, description and image url for each item" do
      i = 1
      5.times do
        Item.create(name: "Generic Item #{i}", description: "A generic item #{i}", image_url: "blah#{i}.com")
        i += 1
      end

      get '/api/v1/items'

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["items"].first["id"]).to eq(1)
      expect(result["items"].first["name"]).to eq("Generic Item 1")
      expect(result["items"].first["description"]).to eq("A generic item 1")
      expect(result["items"].first["image_url"]).to eq("blah1.com")
      expect(result["items"].last["id"]).to eq(5)
      expect(result["items"].last["name"]).to eq("Generic Item 5")
      expect(result["items"].last["description"]).to eq("A generic item 5")
      expect(result["items"].last["image_url"]).to eq("blah5.com")
    end
  end

  # When I send a GET request to `/api/v1/items`
  # I receive a 200 JSON response containing all items
  # And each item has an id, name, description, and image_url but not the created_at or updated_at

  context "when viewing a single items page" do
    it "displays id, name, description and image url for the item" do
      Item.create(name: "Generic Item", description: "A generic item", image_url: "blah.com")

      get '/api/v1/items/1'

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["item"]["id"]).to eq(1)
      expect(result["item"]["name"]).to eq("Generic Item")
      expect(result["item"]["description"]).to eq("A generic item")
      expect(result["item"]["image_url"]).to eq("blah.com")
    end
  end

  # When I send a DELETE request to `/api/v1/items/1`
  # I receive a 204 JSON response if the record is successfully deleted

  context "when deleting an entry" do
    xit "is not displayed on the index page" do

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
    xit "returns json containing relevant info" do

    end
  end
end
