defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Users.User

  def user_factory do
    %User{
      address: "Rua das raparigas",
      name: "Mateus",
      email: "mateus@bananas.com",
      cpf: "123456789",
      age: 28
    }
  end
end
