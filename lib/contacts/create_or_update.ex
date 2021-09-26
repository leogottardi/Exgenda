defmodule Exgenda.Contacts.CreateOrUpdate do
  alias Exgenda.Contacts.Contact
  alias Exgenda.Contacts.Agent, as: ContactAgent

  def call(params) do
    params
    |> Contact.build()
    |> save_contact()
  end

  defp save_contact({:ok, contact}), do: ContactAgent.save(contact)
  defp save_contact({:error, _reason} = error), do: error
end
