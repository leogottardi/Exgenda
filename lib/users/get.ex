defmodule Exgenda.Users.Get do
  alias Exgenda.Users.Agent, as: UserAgent

  def call(cpf) do
    cpf
    |> UserAgent.get()
  end
end
