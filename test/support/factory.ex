defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      address: "Rua das raparigas",
      name: "Mateus",
      email: "mateus@bananas.com",
      cpf: "123456789",
      age: 28
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end
end
