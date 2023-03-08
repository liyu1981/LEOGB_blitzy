defmodule Blitzy.Supervisor do
  use Supervisor

  def start_link(:ok) do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      %{
        id: Blitzy.TaskSupervisor,
        start: {Task.Supervisor, :start_link, [[name: Blitzy.TaskSupervisor]]}
      }
    ]

    r = Supervisor.init(children, strategy: :one_for_one)
    IO.puts("Blitzy.Supervisor started as #{inspect(self())}")
    r
  end
end
