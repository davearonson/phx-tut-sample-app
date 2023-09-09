defmodule SampleAppWeb.DynamicTextHelpers do

  @base_title SampleAppWeb.base_title

  def page_title(assigns) do
    assigns
    |> get_page_title()
    |> put_base_title()
  end

  defp put_base_title(nil), do: @base_title

  defp put_base_title(title) do
    [title, " | ", @base_title]
  end

  defp get_page_title(%{action: action}),
    do: action |> Atom.to_string |> String.capitalize

  defp get_page_title(_), do: nil
end
