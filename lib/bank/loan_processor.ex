defmodule Bank.LoanProcessor do
  use GenServer

  @name :bank_loan_processor

  def start_link do
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  def submit(loan_pid) do
    {:ok, loan_pid}
  end

  def status(loan_pid) do
    :approved
  end
end
