#Journey
## Initial Setup
Created app using `mix phx.new phoenix_app`

Installed dependencies with `mix deps.get`

Created db and tables using `mix ecto.create`

Run initial migrations using `mix ecto.migrate`

Run the app using `mix phx.server`

Create Accounts context and Users model`mix phx.gen.context Accounts User users first_name:string last_name:string is_active:boolean email:string password:string`

Run migrations again `mix ecto.migrate`

