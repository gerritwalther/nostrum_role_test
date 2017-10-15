defmodule NostrumTest do

  use Nostrum.Consumer

  alias Nostrum.Api

  require Logger

  def start_link do
    Consumer.start_link(__MODULE__, %{})
  end

  def handle_event({:MESSAGE_CREATE, {msg}, _ws_state}, state) do
    case msg.content do
      "!role" ->
        {guild_id, role_id} = create_test_role()

        Api.create_message(msg.channel_id, "<@&#{role_id}>")

        delete_test_role guild_id, role_id
      _ ->
        :ignore
    end

    {:ok, state}
  end

  def handle_event(_, state) do
    {:ok, state}
  end

  def create_test_role() do
    {:ok, [guild|_]} = Api.get_current_users_guilds()
    {:ok, role} = Api.create_guild_role(guild["id"], %{name: "Test", permissions: 104324161, mentionable: true})
    {guild["id"], role["id"]}
  end

  def delete_test_role(guild_id, role_id) do
    Api.delete_guild_role(guild_id, role_id)
  end

  def get_role_by_name(role_name, [role|other]) do
    if (role["name"] == role_name) do
      role["id"]
    else
      get_role_by_name role_name, other
    end
  end

  def get_role_by_name(_, []) do
    12356
  end

end