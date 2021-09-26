defmodule Exgenda.Users.CreateOrUpdate do
  alias Exgenda.Users.User
  alias Exgenda.Users.Agent, as: UserAgent

  def call(params) do
    params
    |> User.build()
    |> save_user()
  end

  defp save_user({:ok, user}), do: UserAgent.save(user)
  defp save_user({:error, _reason} = error), do: error
end
