defmodule Lehelchatbot.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add :comment_id, :serial, primary_key: true
      add :username, :string
      add :message, :string
      timestamps
    end
  end
end
