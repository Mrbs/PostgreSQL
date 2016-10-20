create or replace functon transfer (
      i_payer text,
      i_recipient text,
      i_amount  numeric(15,2))
returns text
as 
$$
