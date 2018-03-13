require 'rails_helper'

describe "Dogs API" do
  it "gets a list of Dogs" do
    # Create a new dog in the Test Database (not the same one as development)
    Dog.create(name: 'Felix', age: 2, enjoys: 'Walks in the park')

    # Make a request to the API
    get '/dogs'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to be_success

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end

  it "creates a dog" do
    # The params we are going to send with the request
    dog_params = {
      dog: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.'
      }
    }

    # Send the request to the server
    post '/dogs', params: dog_params

    # Assure that we get a success back
    expect(response).to be_success

    # Look up the dog we expect to be created in the Database
    new_dog = Dog.first

    # Assure that the created dog has the correct attributes
    expect(new_dog.name).to eq('Buster')
  end
end
