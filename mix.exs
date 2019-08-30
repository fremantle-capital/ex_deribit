defmodule ExDeribit.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_deribit,
      version: "0.0.1",
      elixir: "~> 1.7",
      package: package(),
      start_permanent: Mix.env() == :prod,
      description: description(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:jason, "~> 1.1.0"},
      {:mapail, "~> 1.0.2"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:exvcr, "~> 0.10.0", only: [:dev, :test]},
      {:ex_unit_notifier, "~> 0.1", only: :test}
    ]
  end

  defp description do
    "Deribit API Client for Elixir"
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["Alex Kwiatkowski"],
      links: %{"GitHub" => "https://github.com/fremantle-capital/ex_deribit"}
    }
  end
end
