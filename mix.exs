defmodule Nifty.MixProject do
  use Mix.Project

  def project do
    [
      app: :nifty,
      version: "0.1.0",
      elixir: "~> 1.6",
      compilers: [:rustler] ++ Mix.compilers,
      rustler_crates: rustler_crates(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp rustler_crates do
    [nifty: [
      path: "native/nifty",
      mode: (if Mix.env == :prod, do: :release, else: :debug),
    ]]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      "test": ["cmd cd native/nifty && cargo test", "test"],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.18"}
    ]
  end
end
