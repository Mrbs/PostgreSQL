create or replace function	format_us_full_name (
								prefix	text,fristname	text,
								mi	text,lastname	text,
								suffix	text)
returns text
as 
$$
declare	
	fname_mi		text;
	fmi_lname		text;
	prefix_fmil		text;
	pfmil_suffix	text;
begin
	fname_mi	:=	concat_wc(' ',
									case	trim(fristname)
									when	''
									then	null
									else	fristname
									end,
									case	trim(mi)
									when	''
									then	null
									else	mi
									end		|| '.');
		);

	fmi_lname	:=	concat_wc(' ',
									case	fname_mi
									when	''
									then	null
									else	fname_mi
									end,
									case	trim(lastname)
									when	''
									then	null
									else	lastname
									end
		);

	prefix_fmil	:=	concat_wc('. ',
									case	trim(prefix)
									when	''
									then	null
									else	prefix
									end,
									case 	fmi_lname
									when	''
									then	null
									else	fmi_lname
									end
		);

	pfmil_suffix :=	concat_wc(', ',
									case	prefix_fmil
									when	''
									then	null
									else	prefix_fmil
									end,
									case	trim(suffix)
									when	''
									then	null
									else	suffix || '.'
									end
		);

	return pfmil_suffix;
	end;
	$$
	language	plpgsql;
