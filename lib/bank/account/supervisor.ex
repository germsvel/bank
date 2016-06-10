defmodule Bank.Account.Supervisor do
  use Supervisor

  @name :bank_account_supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: @name)
  end

  def start_child do
    Supervisor.start_child(@name, [])
  end

  def init(_) do
    children = [
      worker(Bank.Account, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
