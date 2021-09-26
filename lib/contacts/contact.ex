defmodule Exgenda.Contacts.Contact do
  alias Exgenda.Users.User

  @keys [:name, :number, :address, :user_cpf]

  @enforce_keys @keys

  defstruct @keys

  def build(%{user: %User{cpf: cpf}, name: name, number: number, address: address}) do
    {:ok,
     %__MODULE__{
       address: address,
       name: name,
       number: number,
       user_cpf: cpf
     }}
  end

  def build(_params), do: {:error, "Invalid params"}
end
