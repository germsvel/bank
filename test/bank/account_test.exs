defmodule Bank.AccountTest do
  use ExUnit.Case
  alias Bank.Account

  test ".get_balance(pid) retrieves the balance in the account" do
    {:ok, pid} = Account.new

    balance = Account.get_balance(pid)

    assert balance == 0
  end

  test ".deposit(pid, amount) updates the balance in the account" do
    {:ok, pid} = Account.new

    Account.deposit(pid, 100)

    assert Account.get_balance(pid) == 100
  end

  test ".withdraw(pid, amount) updates the balance in the account by removing the amount" do
    {:ok, pid} = Account.new

    Account.deposit(pid, 100)
    Account.withdraw(pid, 50)

    assert Account.get_balance(pid) == 50
  end
end
