defmodule Exgenda.Contacts.ContactTest do
  use ExUnit.Case

  alias Exgenda.Contacts.Contact
  alias Exgenda.Users.User

  describe "build/1" do
    test "when all params are valid, return a user" do
      user_params = %{name: "Leonardo", age: 22, cpf: "12345"}

      {:ok, user} = User.build(user_params)

      contact_params = %{
        user: user,
        name: "Leonardo",
        number: "27992842391",
        address: "Rua Palmeiras"
      }

      response = Contact.build(contact_params)

      expected_response =
        {:ok,
         %Exgenda.Contacts.Contact{
           address: "Rua Palmeiras",
           name: "Leonardo",
           number: "27992842391",
           user_cpf: "12345"
         }}

      assert response == expected_response
    end

    test "when send params without user, returns a error" do
      contact_params = %{
        name: "Leonardo",
        number: "27992842391",
        address: "Rua Palmeiras"
      }

      response = Contact.build(contact_params)
      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end
  end
end
