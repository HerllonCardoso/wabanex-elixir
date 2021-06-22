defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:email, :password, :name]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_lenght(:password, min: 6)
    |> validate_lenght(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constrant([:email])
  end
end
