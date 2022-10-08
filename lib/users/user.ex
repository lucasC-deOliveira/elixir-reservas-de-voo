defmodule Flightex.Users.User do
  @keys [:name, :email, :cpf, :id]

  @enforce_keys @keys

  @message_all_fields_error "All fields must be informed: name, email, cpf"

  defstruct @keys

  def build(name, _email, _cpf, _id) when not is_bitstring(name) do
    {:error, "Name must be a String"}
  end

  def build(_name, _email, cpf, _id) when not is_bitstring(cpf) do
    {:error, "Cpf must be a String"}
  end

  def build(_name, email, _cpf, _id) when not is_bitstring(email) do
    {:error, "Email must be a string"}
  end

  def build(name, _email, _cpf) when not is_bitstring(name) do
    {:error, "Name must be a String"}
  end

  def build(_name, _email, cpf) when not is_bitstring(cpf) do
    {:error, "Cpf must be a String"}
  end

  def build(_name, email, _cpf) when not is_bitstring(email) do
    {:error, "Email must be a string"}
  end

  def build(name, email, cpf, id) do
    {:ok,
     %__MODULE__{
       id: id,
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(name, email, cpf) do
    id = UUID.uuid4()

    {:ok,
     %__MODULE__{
       id: id,
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_, _), do: {:error, @message_all_fields_error}

  def build(_), do: {:error, @message_all_fields_error}

  def build, do: {:error, @message_all_fields_error}
end
