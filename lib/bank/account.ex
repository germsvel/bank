defmodule Bank.Account do
  defstruct name: nil, balance: 0

  def new do
    Agent.start_link(fn -> %Bank.Account{} end)
  end

  def get_balance(pid) do
    Agent.get(pid, fn account -> account.balance end)
  end

  def deposit(pid, amount) do
    Agent.update(pid, fn account ->
      %{account | balance: account.balance + amount}
    end)
  end

  def withdraw(pid, amount) do
    Agent.update(pid, fn account ->
      %{account | balance: account.balance - amount}
    end)
  end
end
