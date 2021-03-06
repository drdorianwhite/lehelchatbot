defmodule Lehelchatbot.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :message, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:user_id])
  end
end
