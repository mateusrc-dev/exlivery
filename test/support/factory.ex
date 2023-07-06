defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      address: "Rua das lindas",
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

  def order_factory do
    %Order{
      user_cpf: "123456789",
      delivery_address: "Rua das lindas",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50")
    }
  end
end
