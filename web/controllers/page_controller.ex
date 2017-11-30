defmodule Lehelchatbot.PageController do
  use Lehelchatbot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
