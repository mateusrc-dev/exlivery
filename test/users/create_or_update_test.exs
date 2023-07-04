defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Mateus",
        address: "Rua das bananeiras, 15",
        email: "mateus@banana.com",
        cpf: "123456789",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, 'Invalid parameters!'}

      assert expected_response == response
    end

    test "when there are invalid params, returns an error" do
    end
  end
end
