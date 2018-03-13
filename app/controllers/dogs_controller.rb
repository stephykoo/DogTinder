class DogsController < ApplicationController
  def index
    dogs = Dog.all
    render json: dogs
  end

  def create
    # Create a new dog
    dog = Dog.create(dog_params)

    # respond with our new dog
    render json: dog
  end

  # Handle strong parameters, so we are secure
  def dog_params
    params.require(:dog).permit(:name, :age, :enjoys)
  end
end
