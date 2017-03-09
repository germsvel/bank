defmodule Bank do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Bank.Account.Supervisor, []),
      supervisor(Bank.Transfer.Supervisor, []),
      worker(Bank.Loan.Processor, [])
    ]

    opts = [strategy: :rest_for_one, name: Bank.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
