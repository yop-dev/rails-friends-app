class MakeUserIdNotNullInFriends < ActiveRecord::Migration[7.0]
  def up
    # Ensure at least one user exists
    user = User.first || User.create!(name: "Default", email: "default@example.com", password: "password")

    # Assign existing friends without a user to this user
    Friend.where(user_id: nil).update_all(user_id: user.id)

    # Now make the column NOT NULL
    change_column_null :friends, :user_id, false
  end

  def down
    change_column_null :friends, :user_id, true
  end
end
