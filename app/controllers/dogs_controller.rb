class DogsController < ApplicationController
  def index
    dogs = Dog.all
    render json: dogs
  end

  def create
    # Create a new dog
    dog = Dog.create(dog_params)
    if dog.valid?
      render json: dog
    else
      render json: dog.errors, status: :unprocessable_entity
    end
  end

  # Handle strong parameters, so we are secure
  def dog_params
    params.require(:dog).permit(:name, :age, :enjoys)
  end
end
