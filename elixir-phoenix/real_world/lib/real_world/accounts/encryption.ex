defmodule RealWorld.Accounts.Encryption do
    alias Comeonin.Bcrypt
    
    def get_password_hash(password) do
        Bcrypt.hashpwsalt(password)
    end

    def validate_password(password, hash) do
        Bcrypt.checkpw(password, hash)
    end
end