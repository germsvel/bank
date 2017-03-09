defmodule Bank.Loan do
  use GenServer

  @name :bank_loan

  def start_link do
    IO.puts ">>> Starting bank loan"
    GenServer.start_link(__MODULE__, [], name: @name)
  end
end
