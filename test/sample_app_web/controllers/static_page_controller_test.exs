defmodule SampleAppWeb.StaticPageControllerTest do
  use SampleAppWeb.ConnCase

  test "should get home", %{conn: conn} do
    conn = get(conn, Routes.static_page_path(conn, :home))

    assert html_response(conn, 200)

    html_response(conn, 200)
    |> assert_select("title", "Home | Phoenix Tutorial Sample App")
  end

  test "should get help", %{conn: conn} do
    conn = get(conn, Routes.static_page_path(conn, :help))

    assert html_response(conn, 200)

    html_response(conn, 200)
    |> assert_select("title", "Help | Phoenix Tutorial Sample App")
  end

  test "should get about", %{conn: conn} do
    conn = get(conn, Routes.static_page_path(conn, :about))

    assert html_response(conn, 200)

    html_response(conn, 200)
    |> assert_select("title", "About | Phoenix Tutorial Sample App")
  end
end
