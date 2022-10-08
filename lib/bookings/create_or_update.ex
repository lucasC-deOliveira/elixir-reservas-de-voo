defmodule Flightex.Bookings.CreateOrUpdate do
  @moduledoc false

  alias Flightex.Bookings.Agent
  alias Flightex.Bookings.Booking

  def call(%{
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_uuid
      }) do
    complete_date
    |> Booking.build(local_origin, local_destination, user_uuid)
    |> save_booking()
  end

  defp save_booking({:ok, %Booking{id: id} = booking}) do
    Agent.save(booking)

    {:ok, id}
  end

  defp save_booking({:error, _reason} = error), do: error
end
