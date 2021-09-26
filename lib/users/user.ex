defmodule Exgenda.Users.User do
  @keys [:name, :age, :cpf]

  @enforce_keys @keys

  defstruct @keys

  def build(%{name: name, age: age, cpf: cpf}) do
    {:ok,
     %__MODULE__{
       age: age,
       cpf: cpf,
       name: name
     }}
  end

  def build(_params), do: {:error, "Invalid params"}
end
