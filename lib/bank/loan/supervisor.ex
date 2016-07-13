defmodule Bank.Loan.Supervisor do
  use Supervisor

  @name :bank_loan_supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: @name)
  end

  def init(_) do
    children = [
      worker(Bank.LoanProcessor, []),
      worker(Bank.Loan, [])
    ]

    supervise(children, strategy: :one_for_all)
  end
end
