defmodule SampleAppWeb.StaticPageControllerTest do
  use SampleAppWeb.ConnCase

  test "should get root", %{conn: conn} do
    conn = get(conn, Routes.root_path(conn, :home))

    html_response(conn, 200)
    |> assert_select("title", "Home | #{SampleAppWeb.base_title}")
  end
  
  test "should get home", %{conn: conn} do
    conn = get(conn, Routes.static_page_path(conn, :home))

    html_response(conn, 200)
    |> assert_select("title", "Home | #{SampleAppWeb.base_title}")
  end

  test "should get help", %{conn: conn} do
    conn = get(conn, Routes.static_page_path(conn, :help))

    html_response(conn, 200)
    |> assert_select("title", "Help | #{SampleAppWeb.base_title}")
  end

  test "should get about", %{conn: conn} do
    conn = get(conn, Routes.static_page_path(conn, :about))

    html_response(conn, 200)
    |> assert_select("title", "About | #{SampleAppWeb.base_title}")
  end

  test "should get contact", %{conn: conn} do
    conn = get(conn, Routes.static_page_path(conn, :contact))

    html_response(conn, 200)
    |> assert_select("title", "Contact | #{SampleAppWeb.base_title}")
  end
end
