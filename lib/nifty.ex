defmodule Nifty do
  use Rustler, otp_app: :nifty, crate: :nifty
  @moduledoc """
  Documentation for Nifty.
  """
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
  def sub(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
