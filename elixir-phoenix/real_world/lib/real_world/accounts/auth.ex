defmodule RealWorld.Accounts.Auth do
    import Ecto.{Query, Changeset}, warn: false

    alias RealWorld.Repo
    alias RealWorld.Accounts.User
    alias RealWorld.Accounts.Encryption

    def find_user_and_check_password(%{}) do
    end
    def register(attrs \\ %{}) do
        %User{}
            |> User.changeset(attrs)
            |> hash_password()
            |> Repo.insert()
    end

    defp check_password(user, password) do
        case user do
            nil -> false
            _ -> Encryption.validate_password(password, user.password)
        end
    end

    def has_password(changeset) do
        case changeset do
            %Ecto.Changeset{valid?: true, changes: %{password: password}} -> put_change(changeset, :password, Encryption.get_password_hash(password))
            _ -> changeset
        end
    end
end