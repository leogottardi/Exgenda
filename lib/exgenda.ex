defmodule Exgenda do
  alias Exgenda.Users.Get, as: GetUser
  alias Exgenda.Users.CreateOrUpdate, as: CreateOrUpdateUser

  alias Exgenda.Contacts.CreateOrUpdate, as: CreateOrUpdateContact
  alias Exgenda.Contacts.Get, as: GetContact

  defdelegate get_user(params), to: GetUser, as: :call
  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call

  defdelegate get_contacts(params), to: GetContact, as: :call
  defdelegate create_or_update_contact(params), to: CreateOrUpdateContact, as: :call
end
