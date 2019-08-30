defmodule ExDeribit.Public do
  alias ExDeribit.HTTPClient

  @spec get_instruments(boolean) :: term
  def get_instruments(expired \\ false) do
    "/public/getinstruments"
    |> HTTPClient.non_auth_get(%{expired: expired})
    |> parse_response()
  end

  @spec getinstruments(boolean) :: term
  def getinstruments(expired \\ false), do: get_instruments(expired)

  defp parse_response({:ok, %ExDeribit.JsonRpcResponse{success: true, result: instruments}}) do
    instruments
    |> Enum.map(&Mapail.map_to_struct(&1, ExDeribit.Instrument, transformations: [:snake_case]))
    |> Enum.reduce(
      {:ok, []},
      fn
        {:ok, i}, {:ok, acc} -> {:ok, [i | acc]}
        _, _acc -> {:error, :parse_result_item_to_instrument}
      end
    )
  end
end