defmodule SampleApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :sample_app,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {SampleApp.Application, []},
      # need :inets cuz we're using Elixir 1.15, not 1.06,
      # "minor" version change my sweet ass!
      extra_applications: [:inets, :logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "1.6.2"},
      {:phoenix_ecto, "4.4.0"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "3.2.0"},
      {:phoenix_live_reload, "1.3.3", only: :dev},
      {:phoenix_live_view, "0.17.10"},
      {:floki, "0.32.1", only: :test},
      {:phoenix_live_dashboard, "0.6.5"},
      {:esbuild, "0.4.0", runtime: Mix.env() == :dev},
      {:swoosh, "1.7.1"},
      {:telemetry_metrics, "0.6.1"},
      {:telemetry_poller, "1.0.0"},
      {:gettext, "0.19.1"},
      {:jason, "1.3.0"},
      {:plug_cowboy, "2.5.2"},
      {:html_assertion, "0.1.5", only: :test},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks,
  # run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.drop --quiet", "ecto.create --quiet",
      "ecto.migrate --quiet", "test"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"]
    ]
  end
end
