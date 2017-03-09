defmodule Bank.Account do
  defstruct balance: 0

  def new do
    {:ok, pid} = Bank.Account.Supervisor.start_child
    pid
  end

  def start_link do
    IO.puts ">>> Starting bank account"
    Agent.start_link(fn -> %Bank.Account{} end)
  end

  def balance(pid) do
    Agent.get(pid, fn account -> account.balance end)
  end

  def deposit(pid, amount) do
    Agent.update(pid, fn account ->
      %{account | balance: account.balance + amount}
    end)
    pid
  end

  def withdraw(pid, amount) do
    Agent.update(pid, fn account ->
      %{account | balance: account.balance - amount}
    end)
  end
end
