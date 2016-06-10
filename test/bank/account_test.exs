defmodule Bank.AccountTest do
  use ExUnit.Case
  alias Bank.Account

  test ".balance(pid) retrieves the balance in the account" do
    balance = Account.new
            |> Account.balance

    assert balance == 0
  end

  test ".deposit(pid, amount) updates the balance in the account" do
    balance = Account.new
            |> Account.deposit(100)
            |> Account.balance

    assert balance == 100
  end

  test ".withdraw(pid, amount) updates the balance in the account by removing the amount" do
    pid = Account.new

    Account.deposit(pid, 100)
    |> Account.withdraw(50)

    assert Account.balance(pid) == 50
  end
end
