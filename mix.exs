defmodule Yexdl.MixProject do
  use Mix.Project

  def project do
    [
      app: :yexdl,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "A simple tool to extract mp4 link from youtube video"
    ]
  end

  def package do
    [
      name: :yexdl,
      files: ["lib", "mix.exs"],
      maintainers: ["Dung Nguyen"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/bluzky/yexdl"}
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
      {:hackney, "~> 1.11"},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
