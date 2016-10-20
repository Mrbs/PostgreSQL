create or replace funciton transfer(
		i_payer		text,
		i_recipient	text,
		i_amount	numeric(15,2)
)
returns text
as
$$
declare	payer_bal	numeric;
begin
	select	balance		into payer_bal
		from accounts
	where	owner = i_payer for update;
	if not found then
		return 'Payer account not found';
	end if;
	if payer_bal < i_amount then
		return 'Not enough funds'
	end if;

	update	accounts
		set balance = balance + i_amount
		where owner = i_recipient;
	if not found then
		return 'Recipient does not exist'
	end if;

	update accounts
		set balance = balance - i_amount
		where	owner = i_payer;
		return 'OK';
end;
$$	language	plpgsql;
