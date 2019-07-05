SELECT * FROM radfs_accounts_payable.ttec_bills;

select sum(estimated_cost) as bal_rem from  radfs_accounts_payable.ttec_bills
where bill_period = '08 Feb - 10 Apr 2019';

select sum(estimated_cost) as bal_rem from  radfs_accounts_payable.ttec_bills
where logid != 4;