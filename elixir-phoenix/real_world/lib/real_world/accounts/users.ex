defmodule RealWorld.Accounts.Users do
    alias RealWorld.Repo
    alias RealWorld.Accounts.User
    alias RealWorld.Accounts.UserFollower

    def get_user!(id) do
        Repo.get!(User, id)
    end

    def update_user(user, attrs) do
        user 
            |> User.changeset(attrs)
            |> RealWorld.Accounts.Auth.hash_password()
            |> Repo.update()
    end

    def follow(user, follwee) do
        %UserFollower{}
            |> UserFollower.changeset(%{usr_id: user.id, followee_id: followee.id})
            |> Repo.insert()
    end

    def unfollow(user, followee) do
        relation = UserFollower
            |> Repo.get_by(user_id: user.id, followee_id: followee.id)

            case relation do
                nil -> false
                relation -> Repo.delete(relation)
            end
    end

    def is_followee?(user, followee) do
        if user !=nill && followee != nil do
            UserFollower |> Repo.get_by(user_id: user.id, followee_id: followee.id) != nil 
                
        else
            nil
        end
    end 
end