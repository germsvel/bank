defmodule Bank.Transfer.Supervisor do
  use Supervisor

  @name :bank_transfer_supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: @name)
  end

  def init(_) do
    children = [
      worker(Bank.Transfer, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
