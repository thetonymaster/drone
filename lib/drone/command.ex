defmodule Drone.Command do
  @doc ~S"""
  Parses the given `line` into a command.

  ## Examples

      iex> Drone.Command.parse "CREATE application 1\r\n"
      {:ok, {:create, "application", "1"}}

      iex> Drone.Command.parse "PUT application 1\r\n"
      {:ok, {:put, "application", "1"}}

      iex> Drone.Command.parse "GET application 1\r\n"
      {:ok, {:get, "application", "1"}}

      iex> Drone.Command.parse "DELETE application 1\r\n"
      {:ok, {:delete, "application", "1"}}

  Unknown commands or commands with the wrong number of
  arguments return an error:

      iex> Drone.Command.parse "UNKNOWN application eggs\r\n"
      {:error, :unknown_command}

      iex> Drone.Command.parse "GET application\r\n"
      {:error, :unknown_command}

  """
  def parse(line) do
    case String.split(line) do
      ["CREATE", application, args] -> {:ok, {:create, application, args}}
      ["GET", application, args] -> {:ok, {:get, application, args}}
      ["PUT", application, args] -> {:ok, {:put, application, args}}
      ["DELETE", application, args] -> {:ok, {:delete, application, args}}
      _ -> {:error, :unknown_command}
    end
  end

  def run(command)

  def run({:create, bu}) do

  end
end
