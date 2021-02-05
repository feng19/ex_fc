defmodule ExFcWeb.PageController do
  use ExFcWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
