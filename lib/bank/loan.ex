defmodule Bank.Loan do
  use GenServer

  @name :bank_loan

  def start_link do
    GenServer.start_link(__MODULE__, [], name: @name)
  end
end
