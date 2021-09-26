defmodule Exgenda.Users.UserTest do
  use ExUnit.Case

  alias Exgenda.Users.User

  describe "build/1" do
    test "when all params are valid, return a user" do
      params = %{name: "Leonardo", age: 22, cpf: "12345"}

      response = User.build(params)

      expected_response = {:ok, %Exgenda.Users.User{age: 22, cpf: "12345", name: "Leonardo"}}

      assert response == expected_response
    end
  end
end
