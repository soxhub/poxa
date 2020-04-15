defmodule Poxa.Mixfile do
  use Mix.Project

  def project do
    [ app: :poxa,
      version: "0.6.0",
      name: "Poxa",
      elixir: "~> 1.2.0",
      deps: deps ]
  end

  def application do
    [ applications: [ :logger, :crypto, :gproc, :cowboy, :asn1, :public_key, :ssl, :edip ],
      included_applications: [ :exjsx, :signaturex ],
      mod: { Poxa, [] } ]
  end

  defp deps do
    [ {:cowboy, "~> 1.0.0" },
      {:exjsx, "~> 3.0"},
      {:signaturex, "~> 1.1.0"},
      {:gproc, "~> 0.3.0"},
      {:meck, "~> 0.8.2", only: :test},
      {:pusher_client, github: "edgurgel/pusher_client", only: :test},
      {:pusher, "~> 0.1.3", only: :test},
      {:exrm, "~> 1.0.8", only: :prod},
      {:edip, "~> 0.4", only: :prod},
      {:inch_ex, only: :docs} ]
  end
end
