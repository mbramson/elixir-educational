defmodule GuesserWeb.PageController do
  use GuesserWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
