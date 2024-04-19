package dao;

import java.util.List;

import entities.Account;

public interface AccountDAO {
	public List<Account> getAll();
	public Account getAccount(String username);
	public void createAccount(Account acc);
	public void updateAccount(Account acc);
}
