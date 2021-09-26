defmodule Exgenda.Contacts.Get do
  alias Exgenda.Contacts.Agent, as: ContactAgent

  def call(user_cpf) do
    user_cpf
    |> ContactAgent.get()
  end
end
