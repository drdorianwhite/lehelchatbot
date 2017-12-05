defmodule UserEndpointsIntegrationTest do
    use ExUnit.Case, async: true
    use Plug.Test
    alias Lehelchatbot.Router
  
    @opts Router.init([])
    test 'listing movies' do
      conn = conn(:get, "/users")
      response = Router.call(conn, @opts)
      assert response.status == 200
    end
  end