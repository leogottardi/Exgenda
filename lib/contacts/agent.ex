defmodule Exgenda.Contacts.Agent do
  alias Exgenda.Contacts.Contact

  use Agent

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Contact{} = contact), do: Agent.update(__MODULE__, &save_contact(&1, contact))

  def get(cpf), do: Agent.get(__MODULE__, &get_contact(&1, cpf))

  defp get_contact(state, cpf) do
    case Map.get(state, cpf) do
      nil -> {:error, "Contact not found"}
      contact -> {:ok, contact}
    end
  end

  defp save_contact(state, %Contact{user_cpf: user_cpf  } = contact) do
    case Map.get(state, user_cpf) do
      nil -> Map.put(state, user_cpf, contact)
      contacts -> Map.put(state, user_cpf, [contact | contacts])
    end
  end
end
  