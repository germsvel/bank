defmodule Bank.Transfer do
  use GenServer

  @name :bank_transfer

  def start_link do
    IO.puts ">>> Starting bank transfer"
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  def status(pid) do
    :processing
  end
end
