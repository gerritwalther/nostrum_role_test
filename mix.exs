defmodule NostrumTest.Mixfile do
  use Mix.Project

  def project do
    [
      app: :nostrum_test,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gun, git: "https://github.com/ninenines/gun.git", ref: "dd1bfe4d6f9fb277781d922aa8bbb5648b3e6756", override: true},
      {:nostrum, git: "https://github.com/Kraigie/nostrum.git"}
    ]
  end
end
