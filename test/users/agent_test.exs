defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case
  alias Exlivery.Users.User
  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "123456789"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "Rua das lindas",
           name: "Mateus",
           email: "mateus@bananas.com",
           cpf: "123456789",
           age: 28
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("00000000")

      expected_response = {:error, "User not found."}

      assert response == expected_response
    end
  end
end
