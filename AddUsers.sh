 # Set Password for all users
 DEFAULT_PASSWORD="Asiekun94"

 # Users for DBAdmins group (format: "Display Name | email")
 DBAdmins=("DB Admin TestUser1|sillomo94@gmail.com" "DB Admin TestUser2|sillomo94@gmail.com" )
 
 # Users for WebAdmins group (format: "Display Name | email")
 WebAdmins=("Web Admin TestUser1|sillomo94@gmail.com" "Web Admin TestUser2| sillomo94@gmail.com")

# Create users and include to the group
create_users() {
    local group_name=$1
    shift
    local users=("$@")

    for entry in "${users[@]}"; do
     display_name="${entry%%|*}"
# Text before |
    user_email="${entry##*|}"
# Text after |

      echo "Creating user:
      $display_name <$user_email>"

# Create the user
      az ad user create --display-name "$display_name" --user-principal-name "$user_email" --password "$DEFAULT_PASSWORD" --force-change-password-next-login true
    
# Add member to Group
      az ad group member add --group "$group_name" --member-id "$user_email"

      echo "$user_email created and added to $group_name"
      echo "_______________________________-"

      done
}

# Create users for WebAdmnins Group
create_users "WebAdmins"
"${WEBADMINS[0]}"

# Create users for DBAdmins Group
create_users "DBAdmins"
"${DBADMINS[0]}"

# To execute the script
chmod +x AddUsers.sh

# Run the script
./AddUsers.sh