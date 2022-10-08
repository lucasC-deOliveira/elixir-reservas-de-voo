defmodule Flightex.Bookings.Booking do
  @keys [:complete_date, :local_origin, :local_destination, :user_id, :id]
  @enforce_keys @keys

  @message_all_fields_error "All fields must be informed: complete_date, local_origin, local_destination, user_id"

  defstruct @keys

  def build(complete_date, local_origin, local_destination, user_id) do
    # TO DO
    id = UUID.uuid4()

    {:ok,
     %__MODULE__{
       id: id,
       complete_date: complete_date,
       local_origin: local_origin,
       local_destination: local_destination,
       user_id: user_id
     }}
  end

  def build(_, _, _), do: {:error, @message_all_fields_error}

  def build(_, _), do: {:error, @message_all_fields_error}

  def build(_), do: {:error, @message_all_fields_error}

  def build, do: {:error, @message_all_fields_error}
end
