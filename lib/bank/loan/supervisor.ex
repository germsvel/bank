defmodule Bank.Loan.Supervisor do
  use Supervisor

  @name :bank_loan_supervisor

  def start_link do
    IO.puts ">>> Starting bank loan supervisor"
    Supervisor.start_link(__MODULE__, [], name: @name)
  end

  def init(_) do
    children = [
      worker(Bank.Loan.Processor, []),
      worker(Bank.Loan, [])
    ]

    supervise(children, strategy: :one_for_all)
  end
end
