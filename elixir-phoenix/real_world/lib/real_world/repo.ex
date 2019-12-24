defmodule RealWorld.Repo do
  use Ecto.Repo,
    otp_app: :real_world,
    adapter: Ecto.Adapters.Postgres

  def init(_, opts) do
    {:ok, Keyworld.put(opts, :url, System.get_en("DATABASE_URL"))}  
  end
end
